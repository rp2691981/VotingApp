from CandidateApp.models import CandidatePost
from django.shortcuts import redirect,render
from django.contrib import messages

def StaffCandCampaign(request):
    if request.session['Staffloginidpk']:
        if request.method=='POST':
            if 'candidatePostSubmit' in request.POST:
                ID=request.POST['candidatePostid']
                request.session['StaffCandidatePostView12']=ID
                return redirect("StaffCandidatePostView")
        obj=CandidatePost.objects.all()
        if obj:
            obj=obj.values()
            obj=  [obj[i:i+3] for i in range(0,len(obj),3)]
        else:
            messages.info(request,"Sorry But There Was No Post")
            return redirect("StaffDashboard")
            
        
        return render(request,'Staff/StaffCandCampaign.html',{'header_nav':'Post','obj':obj})
    else:
        return redirect("home_page")


def StaffCandidatePostView(request):
    if request.session['Staffloginidpk']:
        id=request.session['StaffCandidatePostView12']
        obj=CandidatePost.objects.filter(pk=id)
        if obj:
            obj=obj.values()
            obj=obj[0]
            return render(request,'Staff/StaffCandidatePostView.html',{'header_nav':'PostView','obj':obj})
        else:
            return redirect("StudentCandCampaign")
    else:
        return redirect("home_page")