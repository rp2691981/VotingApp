from django.contrib import messages
from django.http.response import HttpResponse
from django.http import HttpResponse
from AdminApp.models import ElectionPostion,AdminApplicationForm
from django.shortcuts import redirect, render
from CandidateApp.models import CandidateLogin
from Staff.models import StaffLogin
from Student.models import UserLogin
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth import authenticate,login


def home(request):
    request.session['StudentUserIdpk']=None
    request.session['CandidateUserIdpk']=None
    request.session['Staffloginidpk']=None
    return render(request,'home/index.html')



def Login_page(request):
    if request.method=='POST':
        if 'StudentSubmit' in request.POST:
            User=request.POST['StuUserId']
            Password1=request.POST['StuPassword']
            Check=UserLogin.objects.filter(UserId=User,Password=Password1)
            check=Check.values()
            for i in check:
                if( i['UserId'])==User:
                    request.session['StudentUserIdpk']=User
                    messages.info(request,"WELCOME to your Profile :- %s"%User)
                    return redirect("stu_Dashboard")                      
        elif 'CandidateSubmit' in request.POST:
            User=request.POST['CandUserid']
            Password1=request.POST['CandPasword']
            Check=CandidateLogin.objects.filter(UserId=User,Password=Password1)
            check=Check.values()
            for i in check:
                if( i['UserId'])==User:
                    request.session['CandidateUserIdpk']=User
                    messages.info(request,"WELCOME to your Profile :- %s"%User)
                    return redirect("Cand_dashboard")
                        
    return render(request,'home/login_form.html')
def StaffLoginform(request):
    if request.method=='POST':
        if 'StaffSubmit' in request.POST:
            User=request.POST['StaffUser']
            password=request.POST['StaffPassword']
            obj=StaffLogin.objects.filter(UserId=User,Password=password)
            for j in obj.values():
                if j['UserId']==User:
                    request.session['Staffloginidpk']=User
                    messages.info(request,"WELCOME to your Profile :- %s"%User)
                    return redirect("StaffDashboard")
            
    return render(request,'home/StaffLoginForm.html',{'header':'Staff Login '})





def selectoption():
        obj=ElectionPostion.objects.all()
    
        if obj:
            obj=obj.values()
            check=list()
            for i in obj:
                check.append([i['Position'],i['Position']])
                print(i['Position'])
            
            return check

        else:
            return [['EMPTY',"Not Set yet"]]
def ApplicationApply(request):
    if request.method=='POST':
        if 'ApplicationSubmit' in request.POST:
            
            name=request.POST['Name']
            Phone=request.POST['Phone']
            
            Email=request.POST['email']
            Gender=request.POST['Gender']
            Position=request.POST['Position']
            if Position!='Empty' and Gender !='Empty':
                obj=AdminApplicationForm.objects.filter(Name=name,phone=Phone,email=Email,gender=Gender,StandPosition=Position)
                if obj :
                   messages.info(request,"YOU Alredy Submitted the Applications")
                else:
                    
                    OBJ=AdminApplicationForm(Name=name,phone=Phone,email=Email,gender=Gender,StandPosition=Position)
                    OBJ.save()
                    messages.info(request,"Application is Submitted")
                    return redirect('home_page')
            else:
                if Position!='Empty': 
                    messages.info(request,'Select gender')
                else:
                    messages.info(request,"Select position")
    return render(request,"home/ApplicationApply.html",{'position':selectoption()})

'''
def AdminLoginform(request):
    if request.method=='POST':
        if 'StaffSubmit' in request.POST:
            User=request.POST['StaffUser']
            password=request.POST['StaffPassword']
            obj=StaffLogin.objects.filter(UserId=User,Password=password)
            for j in obj.values():
                if j['UserId']==User:
                    request.session['Staffloginidpk']=User
                    messages.info(request,"WELCOME to your Profile :- %s"%User)
                    return redirect("StaffDashboard")
            
    return render(request,'home/AdminloginForm.html',{'header':'Admin Login '})'''

def adminlogin(request):
    if request.method=='POST':
        fm=AuthenticationForm(request=request,data=request.POST)
        if fm.is_valid():
            uname=fm.cleaned_data['username']
            upass=fm.cleaned_data['password']
            user=authenticate(username=uname,password=upass)
            if user is not None:
                
                login(request,user)
                return redirect("Admin_dashboard")
    fm=AuthenticationForm()
    return render(request,'home/Adminlogin.html',{'header':'Admin Login ','form':fm})