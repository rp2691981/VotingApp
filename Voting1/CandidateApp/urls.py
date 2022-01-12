from django.urls import path
from.views import CandidateDashboard,CandidateProfil,CandidatePost12,CandidateCurrentStatus,Candlogout
from.views import CandidateProfile_Edit
from .view2 import CandCheckPostDash,CandidateAllPOST,CandidateOwnPOST,CandidatePostView,CandidatePostViewBack
import random
def dynamic_url():
    Large=['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
    small=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
    sign=['1','2','3','4','5','6','7','9','0','+0','_']
    p=(''.join([''.join( random.sample(Large, 5)),''.join(random.sample(small, 5)),''.join(random.sample(sign, 5))]))
    return (''.join( random.sample(p, 10)))

urlpatterns = [
    path('',CandidateDashboard,name='Cand_dashboard'),
    path('profile/',CandidateProfil,name='Cand_profile'),
    path('CandidateProfile_Edit/',CandidateProfile_Edit,name='CandidateProfile_Edit'),
    path('CurrentStatus/',CandidateCurrentStatus,name='Candi_CurrentStatus'),
    path('post%s/'%dynamic_url(),CandidatePost12,name='Cand_post'),
    path('Candlogout%s/'%dynamic_url(),Candlogout,name='Candlogout'),

    path('CandCheckPostDash%s/'%dynamic_url(),CandCheckPostDash,name='CandCheckPostDash'),
    path('CandidateAllPOST%s/'%dynamic_url(),CandidateAllPOST,name='CandidateAllPOST'),
    path('CandidateOwnPOST%s/'%dynamic_url(),CandidateOwnPOST,name='CandidateOwnPOST'),
    path('CandidatePostView%s/'%dynamic_url(),CandidatePostView,name='CandidatePostView'),
    path('CandidatePostView%s/'%dynamic_url(),CandidatePostViewBack,name='CandidatePostViewBack'),

]
