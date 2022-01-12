from django.shortcuts import render,redirect
from django.http import HttpResponseRedirect
from Student.models import UserLogin,UserProfile
from AdminApp.models import ElectionPostion,PositionBlock
from CandidateApp.models import CandidateLogin,CandidateProfile
from django.contrib import messages
from .models import StaffProfile

#messages.info(request,"WELCOME to your Profile :- %s"%User)
# Create your views here.
def StaffDashboard(request):
    if request.session['Staffloginidpk']:
        return render(request,'./Staff/StaffDashboard.html',{'header_nav':'Dashboard'})
    else:
        return redirect("home_page")
#list of student work
def StaffProfileDisplay(request):
    if request.method=='POST':
        if 'StaffProfileSubmit' in request.POST:
            #'UserId_id' 'Name' 'Phone' 'AlternateNumber', 'Email', 'Gender'
            user=request.POST['UserId_id']
            name=request.POST['Name']
            phone=request.POST['Phone']
            alter=request.POST['AlternateNumber']
            email=request.POST['Email']
            gender=request.POST['Gender']
            
            obj=StaffProfile(UserId_id=user,Name=name,Phone=phone,AlternateNumber=alter,Email=email,Gender=gender)
            obj.save()
            messages.info(request,"😉 Profile is Updated 😉")
            return redirect("StaffProfileDisplay")
            
    Form_field=StaffProfile.objects.filter(UserId_id="ravi")
    Form_field=Form_field.values()
    Form_field=Form_field[0]
    Form_field=Form_field.items()
    return render(request,'Staff/StaffProfile.html',{'data':Form_field,'headername':'StaffProfile'})


def SatffStudentList(request):
    if request.session['Staffloginidpk']: 
        if request.method=='POST':
            p=request.POST['StudentUserId'].split()        
            List_Of_All_Student=UserProfile.objects.filter(UserId=p[0])
            StudentUser=None
            for list1 in List_Of_All_Student.values():
                StudentUser=list1['UserId_id']
                break
            request.session['StaffStudentUserId_id']=StudentUser
            return redirect('StaffStudentProfile')        
        List_Of_All_Student=UserLogin.objects.all()       
        return render(request,'./Staff/StaffStudentList.html',{'header_nav':'StudentList','List_Of_All_Student':List_Of_All_Student})
    else:
        return redirect("home_page")
#viewed student profile
def StaffStudentProfile(request):
    if request.session['Staffloginidpk']:
        if request.session['StaffStudentUserId_id'] is not None:
            user=request.session['StaffStudentUserId_id']
            obj=UserProfile.objects.filter(UserId=user)
            obj=(obj.values())[0]
            return render(request,'./Staff/StaffStudentProfile.html',{'header_nav':'stuUserID','data':obj})
        else:
            return HttpResponseRedirect('/Staff/')
    else:
        return redirect("home_page")


def StaffStudentProfileback(request):
    if request.session['Staffloginidpk']:
        request.session['StaffStudentUserId_id']=''
        print("Back is worked  ... ")
        return redirect("StaffStudentList")
    else:
        return redirect("home_page")



#list of Candidate total

def SatffCandidateList(request):
    if request.session['Staffloginidpk']:
        if request.method=='POST':
            if 'viewcan' in request.POST:
                p=request.POST['CandidateListUserid'].split()
                List_Of_All_Student=CandidateProfile.objects.filter(UserId_id=p[0])
                candidateuserid=None
                for dict in List_Of_All_Student.values():
                    candidateuserid=dict['UserId_id']
                    break
                request.session['StaffCandidateUserId_id']=candidateuserid
                if request.session['StaffCandidateUserId_id'] is not None:
                    return redirect('SatffCandidateProfile')
        List_Of_All_Student=CandidateLogin.objects.all() 
        return render(request,'./Staff/StaffCandidateList.html',{'header_nav':'CandidateList','List_Of_All_Student':List_Of_All_Student})   
    else:
        return redirect("home_page")


#viewed candidate profile
def SatffCandidateProfile(request):
    if request.session['Staffloginidpk']:
        if request.session['StaffCandidateUserId_id']:
            userid=request.session['StaffCandidateUserId_id']
            obj=CandidateProfile.objects.filter(UserId_id=userid)
            data=obj.values()
            data=data[0]
            return render(request,'./Staff/StaffCandidateProfile.html',{'header_nav':'CandiUserId','data':data})
        else:
            return HttpResponseRedirect('/Staff/CandidList/')
    else:
        return redirect("home_page")


def SatffCandidateProfileBack(request):   
    if request.session['Staffloginidpk']: 
        request.session['StaffCandidateUserId_id']=''
        print('request. session[staff candid profile is None ]',request.session['StaffCandidateUserId_id'])
        print("it worked")
        return redirect('SatffCandidateList')
    else:
        return redirect("home_page")


#form

# student form add user is connecting to database
# check user is alredy availabel or not
def Check(obj,UserId1):
    return len(obj.objects.filter(UserId=UserId1))==0
#end 
def StaffStudentAddForm(request):
    if request.session['Staffloginidpk']:
        if request.method=='POST':
            if 'StudentSubmit' in request.POST:
                StuUser=request.POST['UserId']
                StuPassword=request.POST['Password']
                ProfileAdded=request.POST['ProfileAdded']
             
                if  Check(UserLogin,StuUser):
                    ConnectionToSave=UserLogin(UserId=StuUser,Password=StuPassword,ProfileAdded=ProfileAdded)
                    ConnectionToSave.save()
                    ConnectionProfile=UserProfile(UserId_id=StuUser)
                    ConnectionProfile.save()
                    messages.info(request,"Student is added :- %s"%StuUser)
                    return HttpResponseRedirect('/Staff/Stulist/')
                else:
                    messages.info(request,"Student is already available try another")
        
        return render(request,'./Staff/StaffForm.html',{'header_nav':'StudentForm'})
    else:
        return redirect("home_page")


def selectoption():
        obj=ElectionPostion.objects.all()
        
        if obj:
            obj=obj.values()
            check=list()
            for i in obj:
                check.append([i['Position'],i['Position']])
            
            return check

        else:
            return [['1',"Not Set yet"]]
def SatffCandidateAddForm(request):
    if request.session['Staffloginidpk']:
        if request.method=='POST':
            if 'CandidateSubmit' in request.POST:
                CandUser=request.POST['UserId']
                CandPassword=request.POST['Password']
                CandPosition=request.POST['Position']
                ProfileAdded=request.POST['ProfileAdded']
                if 'EMPTY'!=CandPosition:
                    if '1'!=CandPosition:
                        if Check(CandidateLogin,CandUser):
                            ConnectionToSave=CandidateLogin(UserId=CandUser,Password=CandPassword,StandForPosition=CandPosition,ProfileAdded=ProfileAdded)
                            ConnectionToSave.save()
                            ConnectionProfile=CandidateProfile(UserId_id=CandUser)
                            ConnectionProfile.save()
                            obj=PositionBlock(position_id=CandPosition,CandidateUserId=CandUser)
                            obj.save()
                            messages.info(request,'Accounted Created ')
                            print(CandUser,CandPassword,CandPosition,ProfileAdded)
                            return HttpResponseRedirect('/Staff/CandidList/')
                        else:
                            messages.info(request,"Candidate is alredy available try another Userid ")
                        
                    else:
                        messages.info(request," Wait For Admin to register A position ")
                else:
                    messages.info(request,'Please Select Position')
                ''''''
        option=selectoption()
        return render(request,'./Staff/StaffCadidForm.html',{'header_nav':'CandidateForm','option':option}) 
    else:
        return redirect("home_page")




def Stafflogout(request):
    if request.session:
        request.session.flush()
    return redirect("home_page")