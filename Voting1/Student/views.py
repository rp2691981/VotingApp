from typing import List
from django.shortcuts import render,redirect
from django.http import HttpResponseRedirect,HttpResponse
from .models import UserLogin,UserProfile
from django.contrib import messages
from AdminApp.models import Ad_DirectComplain
from CandidateApp.models import CandidatePost

# Create your views here
#  '': 'Enter your Name', 'Phone': 'Add Number', 'AlternateNumber': 'Alternate Number', 'Email': 'User@example.com', 'Gender': 'gender!', 'CollegeName': 'Netaji Subhas University', 'Profile': 'Add Image'}.



            #student part start
#student dashboard           
def studentDashboard(request):
    if request.session['StudentUserIdpk']:
        return render(request,'student/student_home.html',{'header_nav':'Dashboard'})
    else:
        return redirect("home_page")
#student profile
def StudentProfile(request):
    if request.session['StudentUserIdpk']:
        user=request.session['StudentUserIdpk']
        obj=UserProfile.objects.filter(UserId_id=user)
        data=obj.values()
        data=data[0]
        return render(request,'student/Stu_profile.html',{'header_nav':'Profile','data':data})
    else:
        return redirect("home_page")



#stuprofile edit block
def Stu_Profile_Edit(request):
    if request.session['StudentUserIdpk']:
        if request.method=='POST':
            if 'StudentProfileSubmit' in request.POST:
                userid=request.POST['UserId_id']
                name=request.POST['Name']
                phone=request.POST['Phone']
                alter=request.POST['AlternateNumber']
                email=request.POST['Email']
                gender=request.POST['Gender']
                coll=request.POST['CollegeName']
                
                obj=UserProfile(UserId_id=userid,Name=name,Phone=phone,AlternateNumber=alter,Email=email,Gender=gender,CollegeName=coll)
                obj.save()
                messages.info(request,'❤️ Profile is Updated ❤️')
                return redirect("stu_Profile")
            else:
                messages.info(request,'Profile is Not Updated')
                
        user=request.session['StudentUserIdpk']
        Form_field=UserProfile.objects.filter(UserId_id=user)
        Form_field=Form_field.values()
        Form_field=Form_field[0]
        Form_field=Form_field.items()
               
        return render(request,'student/StuProfile_Edit.html',{'data':Form_field,'headername':'ProfileEdit'})
    else:
        return redirect("home_page")
#stu_complain box
def Stu_complain(request):
    if request.session['StudentUserIdpk']:
        if request.method=='POST':
            if 'ComplainSubmit' in request.POST:
                user=request.session['StudentUserIdpk']
                objem=UserProfile.objects.filter(UserId_id=user)
                objem=objem.values()
                objem=objem[0]
                print(objem)
                comfor=request.POST['ComplainFor']
                Subj=request.POST['Subject']
                Des=request.POST['Description']
                email=objem['Email']
                obj=Ad_DirectComplain(ComplainFrom_UserId=user,UserEmail=email,ComplainFor=comfor,Subject=Subj,Description=Des)
                if obj:
                    obj.save()
                    messages.info(request,'Complained send to admin wait for respond Now')
                    return redirect("stu_Dashboard")
                else:
                    messages.info(request,'complain not failed')
                    return redirect("Stu_complain")
        
        return render(request,'student/Stu_complain_box.html',{'header_nav':'Complain'})
    else:
        return redirect("Login_page")
#Contact us
def Contact_us(request):
    if request.session['StudentUserIdpk']:
        return render(request,'student/Contact.html',{'header_nav':'Contact'})
    else:
        return redirect("home_page")

#studentVoting




#LogOut Session End
def StudentLogOut(request):
    #flush the request session 
    if request.session['StudentUserIdpk']:
        request.session.flush()
    return redirect('home_page')   




def StudentCandCampaign(request):
    if request.session['StudentUserIdpk']:
        if request.method=='POST':
            if 'candidatePostSubmit' in request.POST:
                ID=request.POST['candidatePostid']
                request.session['StudentCandidatePostView']=ID
                return redirect("StudentCandidatePostView")
        obj=CandidatePost.objects.all()
        if obj:
            obj=obj.values()
            obj=  [obj[i:i+3] for i in range(0,len(obj),3)]
        else:
            messages.info(request,"Sorry But There Was No Post")
            return redirect("stu_Dashboard")
            
        
        return render(request,'student/Student_CandCampaign.html',{'header_nav':'Campaign','obj':obj})
    else:
        return redirect("home_page")


def StudentCandidatePostView(request):
    if request.session['StudentCandidatePostView']:
        id=request.session['StudentCandidatePostView']
        obj=CandidatePost.objects.filter(pk=id)
        if obj:
            obj=obj.values()
            obj=obj[0]
            return render(request,'student/StudentCandidatePostView.html',{'header_nav':'PostView','obj':obj})
        else:
            return redirect("StudentCandCampaign")
    else:
        return redirect("home_page")
