from django.http import request
from django.shortcuts import redirect, render
from .forms import StudentAddForm,StaffAddForm,AdminPositionelection
from  .models import ElectionPostion,PositionBlock
from django.contrib import messages

from CandidateApp.models import CandidateLogin,CandidateProfile
from Staff.models import StaffLogin,StaffProfile
from Student.models import UserLogin,UserProfile
from django.contrib.auth import logout

# its check user is alredy availble or not
def AvailbleCheck(obj,UserId1):
    return len(obj.objects.filter(UserId=UserId1))==0
# end


# Create your views here.
def AdminDashboard(request):
    if request.user.is_authenticated:
        
        return render(request,'Admin/AdminDashboard.html',{'headerfilename':'Dashboard'})
       
    else:
            return redirect("adminlogin")


#student part start
def AdminStudentList(request):
    if request.user.is_authenticated:
        if request.method=='POST':
            if 'AdminStudentUserSubmit' in request.POST:
                user=request.POST['AdminStudentUserId']
                user=list(user)
                del user[0]
                user=''.join(user)
                request.session['AdminStudentUserSubmit']=user
                return redirect("AdminStudentProfile")
            elif 'AdminStudentUserDelete' in request.POST:
                user=request.POST['AdminStudentUserId']
                user=list(user)
                del user[0]
                user=''.join(user)
                obj=UserLogin.objects.get(pk=user)
                obj.delete()
                messages.info(request,'Student Is Deleted %s '%user)
            
        obj=UserLogin.objects.all()
        return render(request,'Admin/AdminStudentList.html',{'headerfilename':'StuList','data':obj})
    else:
            return redirect("adminlogin")

def AdminStudentProfile(request):
    if request.user.is_authenticated:
        if request.session['AdminStudentUserSubmit']:
            user=request.session['AdminStudentUserSubmit']
            obj=UserProfile.objects.filter(UserId=user)
            obj=obj.values()
            obj=obj[0]
            obj=obj.items()       
    
            return render(request,'Admin/AdminStaffProfile.html',{'headername':'Studentrofile',"data":obj})
        else:
            return redirect("AdminStudentList")
    else:
            return redirect("adminlogin")

def AdminStudentAdd(request):
    if request.user.is_authenticated:
        if request.method=='POST':
            form_obj=StudentAddForm(request.POST)
            if form_obj.is_valid():
                user=form_obj.cleaned_data['UserId']
                password=form_obj.cleaned_data['Password']
                if AvailbleCheck(UserLogin,user):
                    conn=UserLogin(UserId=user,Password=password)
                    conn.save()
                    connprofile=UserProfile(UserId_id=user)
                    connprofile.save()
                    messages.info(request,'User is Created')
                    return redirect("AdminStudentList")
                else:
                    messages.info(request,'User is Alredy availbale ')
                
        form=StudentAddForm()
        return render(request,'Admin/AdminFormAdd.html',{'headerfilename':'StudentForm','Form_field':form})
    else:
            return redirect("adminlogin")
#student part end here



#Candidate part start
def AdminCandidateList(request):
    if request.user.is_authenticated:
        if request.method=='POST':
            if 'Candidatesubmit' in request.POST:
                user=(request.POST['StudentUserId'])
                request.session['AdminCandidateProfile']=user   
                return redirect("AdminCandidateProfile") 
            elif 'CandidateDelete' in request.POST:
                user=(request.POST['StudentUserId'])
                obj=CandidateLogin.objects.get(pk=user)
                obj.delete()
                messages.info(request,"Candidate IS deleted : %s"%user)
                return redirect("AdminCandidateList") 
        obj=CandidateLogin.objects.all()
        return render(request,'Admin/AdminCandidateList.html',{'headerfilename':'CandidateList','List_Of_All_Student':obj})
    else:
            return redirect("adminlogin")

def AdminCandidateProfile(request):
    if request.user.is_authenticated:
        if request.session['AdminCandidateProfile']:
            user=request.session['AdminCandidateProfile']
            obj=CandidateProfile.objects.filter(UserId=user) 
            obj=obj.values()
            obj=obj[0]
            obj=obj.items()       
    
            return render(request,'Admin/AdminStaffProfile.html',{'headername':'CandidateProfile',"data":obj})
        else:
            return redirect("AdminStudentList")
    else:
            return redirect("adminlogin")


def selectoption():
        obj=ElectionPostion.objects.all()
        print(obj)
        if obj:
            obj=obj.values()
            check=list()
            for i in obj:
                check.append([i['Position'],i['Position']])
            print(check)
            return check

        else:
            return [['EMPTY',"Not Set yet"]]
    

def AdminCandidateAdd(request):
    if request.user.is_authenticated:
        if request.method=='POST':
            if 'AdminStudentSubmit' in request.POST:
                print(request.POST)
            
                user=request.POST['UserId']
                password=request.POST['Password']
                position=request.POST['position']
                
                if 'EMPTY'!=position:
                    if 'Select'!=position:
                        if AvailbleCheck(CandidateLogin,user):
                            conn=CandidateLogin(UserId=user,Password=password,StandForPosition=position)
                            conn.save()
                            connprofile=CandidateProfile(UserId_id=user)
                            connprofile.save()
                            obj=PositionBlock(position_id=position,CandidateUserId=user)
                            obj.save()
                            messages.info(request,'Accounted Created ')
                            return redirect("AdminCandidateList")
                        else:
                            messages.info(request,'User is Alredy availbale ')
                    else:
                        messages.info(request,'Select Position first')
                else:
                    messages.info(request,'Wait For The Admin to set Election For')

        option =selectoption()
        return render(request,'Admin/AdminCandidateForm.html',{'headerfilename':'CandidateForm','option':option})
    else:
            return redirect("adminlogin")


#staff pannel  
def AdminStaffList(request):
    if request.user.is_authenticated:
        if request.method=='POST':
            if 'AdminStaffSubmit' in request.POST:
                UserId=request.POST['UserId'].split()
                UserId=UserId[0]
                email=StaffProfile.objects.filter(UserId=UserId)
                email=email.values()
                for i in email:
                    request.session['AdimStaffUserEmail']= i['Email']
                    break
                request.session['AdimStaffUserid']=  UserId
                return redirect("AdminStaffdashboard") 
            elif 'AdminStaffDelete' in request.POST:
                UserId=request.POST['UserId'].split()
                UserId=UserId[0]
                obj=StaffLogin.objects.get(pk=UserId)
                obj.delete()
                messages.info(request,'Staff Is Deleted %s '%UserId)
                
                
        obj=StaffLogin.objects.all()
        return render (request,'Admin/AdminStaffList.html',{'headerfilename':'StaffList','List_Of_All_Student':obj }) 
    else:
            return redirect("adminlogin")
def AdminStaffAdd(request):
    if request.user.is_authenticated:
        if request.method=='POST':
            form_obj=StaffAddForm(request.POST)
            if form_obj.is_valid():
                User=(form_obj.cleaned_data['UserId'])
                Password1=(form_obj.cleaned_data['Password'])
                if AvailbleCheck(StaffLogin,User):
                    conn=StaffLogin(UserId=User,Password=Password1)
                    conn.save()
                    connprofile=StaffProfile(UserId_id=User)
                    connprofile.save()
                    messages.info(request,'Staff is created ')
                    return redirect('AdminStaffList')                
                else:
                    messages.info(request,'User is Alredy availbale ')
        form=StaffAddForm()
        return render(request,'Admin/AdminFormAdd.html',{'headerfilename':'StaffForm','Form_field':form})
    else:
            return redirect("adminlogin")

def AdminStaffdashboard(request):
    if request.user.is_authenticated:
        if request.session['AdimStaffUserid']:
            return render(request,'Admin/AdminStaffDash.html',{'headerfilename':'StaffDashboard','AdimStaffUserid':request.session['AdimStaffUserid']})
        return redirect("AdminStaffList")
    else:
            return redirect("adminlogin")


def AdminDashProfile(request):
    if request.user.is_authenticated:
        if request.session['AdimStaffUserid']:
            user=request.session['AdimStaffUserid']
            obj= StaffProfile.objects.filter(UserId_id=user)
            print(" /n")
            obj=(obj.values())
            obj=(obj[0])
            obj=obj.items()
            return render(request,'Admin/AdminStaffProfile.html',{'headername':'Staffprofile',"data":obj})
        return redirect("AdminStaffList")
    else:
            return redirect("adminlogin")

def AdStaffCandList(request):
    if request.user.is_authenticated:
        if request.method=='POST':
            #,AdminStaffStudentUserID
            if "AdminStaffStudentCandidateUserID" in request.POST:
                UserID=request.POST['StudentUserId']
                request.session['AdminStaffCandidateProfile']=UserID

                return redirect("AdminstaffDashCandidateProfile")
            if 'AdminStaffStudentCandidateUserIDDelete' in request.POST:
                user=request.POST['StudentUserId']
                user=list(user)
                del user[0]
                user=''.join(user)
                obj=CandidateLogin.objects.get(pk=user)
                obj.delete()
                messages.info(request,'Canddidate is Deleted ')
                

        obj=CandidateLogin.objects.filter(ProfileAdded=request.session['AdimStaffUserid'])
        obj=obj.values()    
        ColumnName=['UserId','Password','AddedBy','Action']
        return render(request,'Admin/AdminStaffStuCanList.html',{'headerfilename':'CandidateList','ColumnName':ColumnName,'AdimStaffUserid':request.session['AdimStaffUserid'],'obj':obj})
    else:
            return redirect("adminlogin")

def AdminstaffDashCandidateProfile(request):
    if request.user.is_authenticated:
        if request.session['AdminStaffCandidateProfile']:

            userid=request.session['AdminStaffCandidateProfile']
            userid=list(userid)
            del userid[0]        
            userid=''.join(userid)
            obj=CandidateProfile.objects.filter(UserId_id=userid)
            obj=(obj.values())
            obj=(obj[0])
            obj=obj.items()        
            return render(request,'Admin/AdminStaffProfile.html',{'headername':'CandidateProfile',"data": obj })
        return redirect("AdStaffCandList")
    else:
            return redirect("adminlogin")

def AdStaffStuList(request):
    if request.user.is_authenticated:
        if request.method=='POST':
            #,AdminStaffStudentUserID
            if "AdminStaffStudentCandidateUserID" in request.POST:
                UserID=request.POST['StudentUserId']
                request.session['AdminStaffStudentProfile']=UserID

                print(list(request.session['AdminStaffCandidateProfile']))
                return redirect("AdminstaffDashStudentProfile")
            elif 'AdminStaffStudentCandidateUserIDDelete' in request.POST:
                user=request.POST['StudentUserId']
                user=list(user)
                del user[0]
                user=''.join(user)
                obj=UserLogin.objects.get(pk=user)
                obj.delete()
                messages.info(request,'Student is Deleted ')

        obj=UserLogin.objects.filter(ProfileAdded=request.session['AdimStaffUserid'])
        obj=obj.values()   
        ColumnName=['UserId','Password','AddedBy','Action']
        return render(request,'Admin/AdminStaffStuCanList.html',{'headerfilename':'StudentList','ColumnName':ColumnName,'AdimStaffUserid':request.session['AdimStaffUserid'],'obj':obj})
    else:
            return redirect("adminlogin")

def AdminstaffDashStudentProfile(request):
    if request.user.is_authenticated:
        if request.session['AdminStaffStudentProfile']:

            userid=request.session['AdminStaffStudentProfile']
            userid=list(userid)
            del userid[0]        
            userid=''.join(userid)
            obj=UserProfile.objects.filter(UserId_id=userid) 
            obj=(obj.values())
            obj=(obj[0])
            obj=obj.items()        
            return render(request,'Admin/AdminStaffProfile.html',{'headername':'CandidateProfile',"data": obj })
        return redirect("AdStaffCandList")
    else:
            return redirect("adminlogin")


def AdminStaffDashBack(request):
    if request.user.is_authenticated:
        return redirect("AdminStaffList")
    else:
            return redirect("adminlogin")

def adminLogout(request):
    logout(request)
    return redirect("adminlogin")

