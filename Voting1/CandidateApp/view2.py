from django.shortcuts import render,redirect
from .models import CandidatePost
from django.contrib import messages



def CandCheckPostDash(request):
    if request.session['CandidateUserIdpk']:
        return render(request,'./Candidate/CandCheckPostDash.html',{'header_nav':'PostDasboard'})
    else:
        return redirect("home_page")




def CandidateAllPOST(request):
    if request.session['CandidateUserIdpk']:
        if request.method=='POST':
            if 'candidatePostSubmit' in request.POST:
                ID=request.POST['candidatePostid']
                request.session['CandidatePostView']=ID
                return redirect("CandidatePostView")
                
        obj=CandidatePost.objects.all()
        if obj:
            obj=obj.values()
            obj=  [obj[i:i+3] for i in range(0,len(obj),3)]
        else:
            messages.info(request,"Sorry But There Was No Post")
            return redirect("CandCheckPostDash")
            
        
        return render(request,'Candidate/CandCheckAllPost.html',{'header_nav':'CheckAllPost','obj':obj})
    else:
        return redirect("home_page")

def CandidateOwnPOST(request):
    if request.session['CandidateUserIdpk']:
        candid=request.session['CandidateUserIdpk']
        
        if request.method=='POST':
            if 'candidatePostSubmit' in request.POST:
                ID=request.POST['candidatePostid']
                request.session['CandidatePostView']=ID
                return redirect("CandidatePostView")
        obj=CandidatePost.objects.filter(CandidateUserId=candid)
        if obj:
            obj=obj.values()
            obj=  [obj[i:i+3] for i in range(0,len(obj),3)]
        else:
            messages.info(request,"Sorry But There Was No Post")
            return redirect("CandCheckPostDash")
            
        
        return render(request,'Candidate/CandCheckAllPost.html',{'header_nav':'Own Post','obj':obj})
    else:
        return redirect("home_page")


def CandidatePostView(request):
    if request.session['CandidatePostView']:
        id=request.session['CandidatePostView']
        obj=CandidatePost.objects.filter(pk=id)
        if obj:
            obj=obj.values()
            obj=obj[0]
            return render(request,'Candidate/CandViewPost.html',{'header_nav':'PostView','obj':obj})
        else:
            return redirect("CandCheckPostDash")
    else:
        return redirect("CandCheckPostDash")

def CandidatePostViewBack(request):
    if request.session['CandidateUserIdpk']:
        if request.session['CandidatePostView']:
            request.session['CandidatePostView']=''
        return redirect("CandCheckPostDash")
    else:
        return redirect("home_page")


      