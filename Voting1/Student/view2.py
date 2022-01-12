from django.contrib import messages
from django.shortcuts import render,redirect
from AdminApp.models import Voting,PositionBlock,ElectionPostion


def Stu_Voting(request):
    if request.session['StudentUserIdpk']:
        if request.method=='POST':
            
            if 'vote' in request.POST:
                stuid=request.session['StudentUserIdpk']
                position=request.POST['position']
                candidateid=request.POST['candidateid']
                obj=Voting.objects.filter(position_id=position,StudentId=stuid)
                if len(obj.values_list())==0:
                    obj=Voting(CandidateUserId=candidateid,StudentId=stuid,position_id=position)
                    obj.save()
                    messages.info(request,"Voted %s"%candidateid)
                    return redirect("stu_Dashboard")
                else:
                    messages.info(request,"You alredy Voted For same Postition")
                    return redirect("stu_Dashboard")

                                      
                

        obj=ElectionPostion.objects.all()
        val=dict()
        if obj:
            seats=[]
            for i in obj.values_list():
                seats.append(i[0])
            for i in seats:
               obj= PositionBlock.objects.filter(position_id=i)
               if obj:
                   val['%s'%i]=obj.values()
            val=val.items()

            return render(request,'student/Stu_Voting.html',{'header_nav':'Voting','val':val})
    else:
        return redirect("home_page")

#{'check1': <QuerySet [{'id': 6, 'position_id': 'check1', 'CandidateUserId': 'ravi1'}, 