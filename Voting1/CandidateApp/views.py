from django.shortcuts import redirect, render
from django.http import HttpResponse
from .models import CandidateProfile,CandidatePost
from django.contrib import messages


# Create your views here.
def CandidateDashboard(request):
    if request.session['CandidateUserIdpk']:
        return render(request,'./Candidate/CandDashboard.html',{'header_nav':'Dashboard'})
    else:
        return redirect("home_page")

# Cnadidate Profile
def CandidateProfil(request):
    if request.session['CandidateUserIdpk']:
        user=request.session['CandidateUserIdpk']
        obj=CandidateProfile.objects.filter(UserId_id=user)
        obj=obj.values()
        obj=obj[0]
        
        return render(request,'./Candidate/Cand_Profile.html',{'header_nav':'Profile','data':obj})
    else:
        return redirect("home_page")

def CandidateProfile_Edit(request):
    if request.session['CandidateUserIdpk']:
        if request.method=='POST':
            if 'CandidateProfileSubmit' in request.POST:
                userid=request.POST['UserId_id']
                name=request.POST['Name']
                phone=request.POST['Phone']
                alter=request.POST['AlternateNumber']
                email=request.POST['Email']
                gender=request.POST['Gender']
                obj=CandidateProfile(UserId_id=userid,Name=name,Phone=phone,AlternateNumber=alter,Email=email,Gender=gender)
                obj.save()
                messages.info(request,'❤️ Profile is Updated ❤️')
                
                return redirect("Cand_profile")
            else:
                messages.info(request,'Profile is Not Updated')
                
        user=request.session['CandidateUserIdpk']
        Form_field=CandidateProfile.objects.filter(UserId_id=user)
        Form_field=Form_field.values()
        Form_field=Form_field[0]
        Form_field=Form_field.items()
               
        return render(request,'./Candidate/CandProfileEdit.html',{'data':Form_field,'headername':'ProfileEdit'})
    else:
        return redirect("home_page")





#CandidatePost
def CandidatePost12(request):
    if request.session['CandidateUserIdpk']:

        if request.method=='POST':
            if 'candidatePost' in  request.POST:
                #CandidatePost                
                file=request.FILES['file']
                user=request.session['CandidateUserIdpk']
                title=request.POST['title']
                des=request.POST['description']

                obj=CandidatePost.objects.create(CandidateUserId_id=user,Title=title,Description=des,Image_File=file)
                obj.save()
                messages.info(request,"Your Post is Updated")
                return redirect("Cand_dashboard")
        return render(request,'./Candidate/CandPost.html',{'header_nav':'Post'})
    else:
        return redirect("home_page")

#Candidate Status
def CandidateCurrentStatus(request):
    if request.session['CandidateUserIdpk']:
        return render(request,'./Candidate/CandidateCurrentStatus.html',{'header_nav':'Result'})
    else:
        return redirect("home_page")

def Candlogout(request):
    if request.session:
        request.session.flush()
    return redirect("home_page")
