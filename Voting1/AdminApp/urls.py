from django.urls import path
from .views import AdminDashboard
#for student part
from .views import AdminStudentList,AdminStudentAdd,AdminStudentProfile
#for Candidate part
from .views import AdminCandidateAdd,AdminCandidateList,AdminCandidateProfile
#for staff
from .views import AdminStaffdashboard,AdStaffCandList,AdStaffStuList,AdminStaffList,AdminStaffAdd,AdminStaffDashBack
#application part
from .views2 import AdminComplainBox1,AdminApplicationBox,AdminPositionAdd,AdminComplainView,AdminComplainView_Back,AdminApplicationView
#Position part
from .views import AdminDashProfile,AdminstaffDashCandidateProfile,AdminstaffDashStudentProfile
from .views2 import AdminCandCampaign,AdminCandCampaignpostView
from .views import adminLogout



from .view3 import AdminVoting,AdminVotingPositionList,AdminPosCandViewList,AdminPosCandViewProfile,AdminVotingReportOfpos
from .view3 import AdminCheckTotalVote

from django.http import HttpResponse

def admin_pannel(request):
    return HttpResponse("ADMIN PANNEL IS LOCKED")

AdStaffCandList
urlpatterns = [
    path('',AdminDashboard,name="Admin_dashboard"),
    path('adminLogout/',adminLogout,name="adminLogout"),


    path('AdminStuList/',AdminStudentList,name="AdminStudentList"),
    path('AdminStuForm/',AdminStudentAdd,name="AdminStudentAdd"),
    path('AdminStudentProfile/',AdminStudentProfile,name="AdminStudentProfile"),
    

    path('AdminCandList/',AdminCandidateList,name="AdminCandidateList"),
    path('AdminCandForm/',AdminCandidateAdd,name="AdminCandidateAdd"),
    path('AdminCandidateProfile/',AdminCandidateProfile,name="AdminCandidateProfile"),
    

    path('AdminComplain/',AdminComplainBox1,name='AdminComplainBox'),
    path('AdminComplainView/',AdminComplainView,name='AdminComplainView'),
    path('AdminComplainView_Back/',AdminComplainView_Back,name='AdminComplainView_Back'),
    path('AdminApplication/',AdminApplicationBox,name='AdminApplicationBox'),
    path('AdminApplicationView/',AdminApplicationView,name='AdminApplicationView'),
    


    path('AdminStaffList/',AdminStaffList,name="AdminStaffList"),
    path('AdminStaffAdd/',AdminStaffAdd,name="AdminStaffAdd"),
    path('AdminStaffDash/',AdminStaffdashboard,name="AdminStaffdashboard"),
    
    path('AdminStaffDashBack/',AdminStaffDashBack,name="AdminStaffDashBack"),
    path('AdStaffCandList/',AdStaffCandList,name="AdStaffCandList"),
    path('AdStaffStuList/',AdStaffStuList,name="AdStaffStuList"),
    


    path('AdminDashProfile/',AdminDashProfile,name="AdminDashProfile"),
    path('AdminstaffDashCandidateProfile/',AdminstaffDashCandidateProfile,name="AdminstaffDashCandidateProfile"),
    path('AdminstaffDashStudentProfile/',AdminstaffDashStudentProfile,name="AdminstaffDashStudentProfile"),
    




    path('AdminPositionAdd/',AdminPositionAdd,name="AdminPositionAdd"),

    path('AdminCandCampaign/',AdminCandCampaign,name="AdminCandCampaign"),
    path('AdminCandCampaignpostView/',AdminCandCampaignpostView,name="AdminCandCampaignpostView"),

    
    #voting urls here  AdminVotingPositionList
    path('AdminVoting/',AdminVoting,name="AdminVoting"),
    path('AdminVotingPositionList/',AdminVotingPositionList,name="AdminVotingPositionList"),
    path('AdminPosCandViewList/',AdminPosCandViewList,name="AdminPosCandViewList"),
    path('AdminPosCandViewProfile/',AdminPosCandViewProfile,name="AdminPosCandViewProfile"),
    path('AdminVotingReportOfpos/',AdminVotingReportOfpos,name="AdminVotingReportOfpos"),
   
   path('AdminCheckTotalVote/',AdminCheckTotalVote,name="AdminCheckTotalVote"), 



]
