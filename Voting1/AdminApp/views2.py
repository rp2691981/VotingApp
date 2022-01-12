from django.shortcuts import render,redirect
from .forms import AdminPositionelection
from .models import Ad_DirectComplain,ElectionPostion,AdminApplicationForm
from django.contrib import messages
from CandidateApp.models import CandidatePost

#Application part
def AdminComplainBox1(request):
    if request.user.is_authenticated:

        if request.method=='POST':
            if 'ComplainView' in request.POST:
                com_id=request.POST['ComplainPKId']
                print(list(com_id))
                request.session['AdminComplainPKID_View']=com_id
                return redirect("AdminComplainView")
            elif 'ComplainDlete' in request.POST:
                com_id=request.POST['ComplainPKId']
                obj=Ad_DirectComplain.objects.get(pk=com_id)
                obj.delete()
                messages.info(request,"Complain has been Deleted")
                
            return redirect("AdminComplainBox")
        List_Of_All_Student=Ad_DirectComplain.objects.all()
        ColumnName=['id','StudentId','ComplainFor','Respond','Action']
        return render(request,'Admin/Admin_Complain_list.html',{'headerfilename':'Complainlist','ColumnName':ColumnName,'List_Of_All_Student':List_Of_All_Student})
    else:
            return redirect("adminlogin")

def AdminComplainView(request):
    if request.user.is_authenticated:
        if request.session['AdminComplainPKID_View']:
            id=request.session['AdminComplainPKID_View']
            obj=Ad_DirectComplain.objects.filter(pk=id)
            obj=obj.values()
            print(obj)
            obj=obj[0]
            return render(request,'Admin/AdminComplainView.html',{'headerfilename':'ComplainView','obj':obj})
        messages.info(request,'Your session Is not set For Viewing The application')    
        return redirect("AdminComplainBox")
    else:
            return redirect("adminlogin")

def AdminComplainView_Back(request):
    if request.user.is_authenticated:

        if request.session['AdminComplainPKID_View']:
            request.session['AdminComplainPKID_View']=''
        return redirect("AdminComplainBox")
    else:
            return redirect("adminlogin")


def AdminApplicationBox(request):
    if request.user.is_authenticated:

        if request.method =='POST':
            if 'ApplictionView' in request.POST:
                print(request.POST)
                request.session['AdminApplicationView']=request.POST['StudentUserId']
                return redirect("AdminApplicationView")
            elif 'ApplictionDelete' in request.POST:
                obj=AdminApplicationForm.objects.get(pk=request.POST['StudentUserId'])
                obj.delete()
                messages.info(request,"Application IS Deleted")
                return redirect("AdminApplicationBox")
        obj=AdminApplicationForm.objects.all()
        obj=obj.values()
        ColumnName=['ID','ApplierName','Position','respond','Action']
        return render(request,'Admin/Admin_Application_List.html',{'headerfilename':'Application','ColumnName':ColumnName,'List_Of_All_Student':obj})
    else:
            return redirect("adminlogin")

def AdminApplicationView(request):
    if request.user.is_authenticated:
        if request.session['AdminApplicationView']:
            user=request.session['AdminApplicationView']
            obj=AdminApplicationForm.objects.filter(pk=user)
            obj=obj.values()
            obj=obj[0]
            obj=obj.items()       
    
            return render(request,'Admin/AdminStaffProfile.html',{'headername':'CandidateApplication',"data":obj})
        else:
            return redirect("AdminStudentList")
    else:
            return redirect("adminlogin")

#ADDED AdminPositionelection
def AdminPositionAdd(request):
    if request.user.is_authenticated:
        if request.method=='POST':
            OBJ=AdminPositionelection(request.POST)
            if OBJ.is_valid():
                p=OBJ.cleaned_data['Position']
                obj=ElectionPostion(Position=p)
                obj.save()
                messages.info(request,'Election Postion Is Added')
                return redirect("Admin_dashboard")
        form=AdminPositionelection()
        return render(request,'Admin/AdminFormAdd.html',{'headerfilename':'PositionForElection','Form_field':form})
    else:
            return redirect("adminlogin")





def AdminCandCampaign(request):

    if request.user.is_authenticated:
   
        if request.method=='POST':
            if 'candidatePostSubmit' in request.POST:
                ID=request.POST['candidatePostid']
                request.session['AdminCandCampaign']=ID
                return redirect("AdminCandCampaignpostView")
        obj=CandidatePost.objects.all()
        if obj:
            obj=obj.values()
            obj=  [obj[i:i+3] for i in range(0,len(obj),3)]
        else:
            messages.info(request,"Sorry But There Was No Post")
            return redirect("StaffDashboard")
            
        
        return render(request,'Admin/AdminCandCampaign.html',{'header_nav':'CandidatePost','obj':obj})
    else:
            return redirect("adminlogin")

def AdminCandCampaignpostView(request):

    if request.user.is_authenticated:
    
        id=request.session['AdminCandCampaign']
        obj=CandidatePost.objects.filter(pk=id)
        if obj:
            obj=obj.values()
            obj=obj[0]
            print(obj)
            return render(request,'Admin/AdminCandCampaignpostView.html',{'header_nav':'CandidatePostView','obj':obj})
        else:
            return redirect("AdminCandCampaign")
    else:
            return redirect("adminlogin")        

