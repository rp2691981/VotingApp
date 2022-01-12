from django.shortcuts import render ,redirect
from django.contrib import messages
from .models import PositionBlock,ElectionPostion,Voting
from CandidateApp.models import CandidateProfile
from Student.models import UserLogin
from collections import defaultdict

def AdminVoting(request):
    if request.user.is_authenticated:
        return render(request,'Admin/voting/AdminVoting.html',{'headerfilename':'Voting'})
    else:
            return redirect("adminlogin")

def AdminVotingPositionList(request):
    if request.user.is_authenticated:
        if request.method=="POST":
            if 'ApplictionView' in request.POST:            
                request.session['AdminVotePosCandViewList']=request.POST['Position']
                return redirect("AdminPosCandViewList")
            elif 'ApplictionDelete' in request.POST:
                pos=request.POST['Position']
                obj=ElectionPostion.objects.get(pk=pos)
                if obj:
                    obj.delete()
                    messages.info(request,"Position has Been Deleted")
                    return redirect("AdminVotingPositionList")
        obj=ElectionPostion.objects.all()
        obj=obj.values()
        return render(request,"Admin/voting/AdminVotingPositionList.html",{'headerfilename':'PositionList','obj':obj})
    else:
            return redirect("adminlogin")

def AdminPosCandViewList(request):
    if request.user.is_authenticated:
        if request.method=='POST':
            if 'ApplictionView' in request.POST:
                request.session['AdminVotePosCandViewProfile']=request.POST['Positioncan']
                return redirect("AdminPosCandViewProfile")
        obj=PositionBlock.objects.filter(position_id=request.session['AdminVotePosCandViewList'])
        obj=obj.values()
        return render(request,"Admin/voting/AdminPositionCandidateStand.html",{'headerfilename':'PositionStandList','obj':obj})
    else:
            return redirect("adminlogin")


def AdminPosCandViewProfile(request):
    if request.user.is_authenticated:
        obj=CandidateProfile.objects.filter(UserId_id=request.session['AdminVotePosCandViewProfile'])
        obj=obj.values()
        obj=obj[0]
        obj=obj.items()
        return render(request,"Admin/voting/AdminVotePosCandViewProfile.html",{'headerfilename':'Profile','obj':obj})
    else:
            return redirect("adminlogin")

def AdminVotingReportOfpos(request):
    if request.user.is_authenticated:
        if request.method=="POST":
            if 'ApplictionView' in request.POST:            
                request.session['AdminVotingReportOfpos']=request.POST['Position']
                return redirect("AdminCheckTotalVote")
            elif 'ApplictionDelete' in request.POST:
                pos=request.POST['Position']
                obj=ElectionPostion.objects.get(pk=pos)
                if obj:
                    obj.delete()
                    messages.info(request,"Position has Been Deleted")
                    return redirect("AdminVotingReportOfpos")
                
        obj=ElectionPostion.objects.all()
        obj=obj.values()
        #'id': 4, 'position_id': 'check1', 'CandidateUserId': 'ravi2', 'StudentId': '1', 'Studentvotingtime':
        
        return render(request,"Admin/voting/AdminVotingPositionList.html",{'headerfilename':'ReportOFPosition','obj':obj})
    else:
            return redirect("adminlogin")


#(2*100)/6
def percentage(a,b):
    return (a*100)//b

def AdminCheckTotalVote(request):
    if request.user.is_authenticated:
        if request.session['AdminVotingReportOfpos']:
            totalstu=len(UserLogin.objects.all())
            obj=Voting.objects.filter(position_id=request.session['AdminVotingReportOfpos'])
            totalvoted=len(obj)
            notvoted=abs(totalstu-totalvoted)
            obj=obj.values()
            name=defaultdict(int)
            for i in obj:
                name[i['CandidateUserId']]+=1
            data=[]
            for i,j in name.items():
                data.append([i,j,percentage(j,totalvoted)])

            
            return render(request,"Admin/voting/AdminCheckTotalVote.html",{'headerfilename':'CheckTotalVote',"totalstu":totalstu,'totalvoted':totalvoted,"name":data,'notvoted':notvoted})
        else:
            return redirect("AdminVotingReportOfpos")
    else:
            return redirect("adminlogin")