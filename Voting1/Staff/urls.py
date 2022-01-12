from django.urls import path
from .views import StaffDashboard,SatffStudentList,SatffCandidateList,StaffStudentProfile,SatffCandidateProfile,StaffProfileDisplay
from .views import StaffStudentAddForm,SatffCandidateAddForm,SatffCandidateProfileBack,StaffStudentProfileback
from .views import Stafflogout
from .views2 import StaffCandCampaign,StaffCandidatePostView
import random
def dynamic_url():
    Large=['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
    small=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
    sign=['1','2','3','4','5','6','7','9','0','+0','_']
    p=(''.join([''.join( random.sample(Large, 5)),''.join(random.sample(small, 5)),''.join(random.sample(sign, 5))]))
    return (''.join( random.sample(p, 10)))
urlpatterns = [
    path('',StaffDashboard,name='StaffDashboard'),
    path('StaffProfileDisplay%s/'%dynamic_url(),StaffProfileDisplay,name='StaffProfileDisplay'),
    #StaffProfileDisplay

    path('Stulist/',SatffStudentList,name='StaffStudentList'),
    path('Stuprofile/',StaffStudentProfile,name='StaffStudentProfile'),
    path('Stuprofileback/',StaffStudentProfileback,name='StaffStudentProfileback'),
    path('%s/'%dynamic_url(),StaffStudentAddForm,name='StaffStudentAddForm'),

    path('CandidList/',SatffCandidateList,name='SatffCandidateList'),
    path('CandidProfile%s/'%dynamic_url(),SatffCandidateProfile,name='SatffCandidateProfile'),
    path('CandidProfileback/',SatffCandidateProfileBack,name='SatffCandidateProfileBack'),
    path('candidateAddForm',SatffCandidateAddForm,name='SatffCandidateAddForm'),

    path('Stafflogout/',Stafflogout,name='Stafflogout'),

    path('StaffCandCampaign/',StaffCandCampaign,name='StaffCandCampaign'),
    path('StaffCandidatePostView/',StaffCandidatePostView,name='StaffCandidatePostView'),
]


