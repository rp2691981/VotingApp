from django.urls import path
from .views import studentDashboard,StudentProfile,Contact_us,Stu_Profile_Edit,Stu_complain,StudentCandCampaign
from .views import StudentLogOut,StudentCandidatePostView
from .view2 import Stu_Voting
import random
def dynamic_url():
    Large=['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
    small=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
    sign=['1','2','3','4','5','6','7','9','0','+0','_']
    p=(''.join([''.join( random.sample(Large, 5)),''.join(random.sample(small, 5)),''.join(random.sample(sign, 5))]))
    return (''.join( random.sample(p, 10)))

urlpatterns = [
    
    path('',studentDashboard,name='stu_Dashboard'),
    path('stuProfile/',StudentProfile,name='stu_Profile'),
    path('Edit_',Stu_Profile_Edit,name='StuProfileEdit'),
    path('complain/',Stu_complain,name='Stu_complain'),
    path('Contact/',Contact_us,name='contact_us'),
    #
    path('Stu_Voting/',Stu_Voting,name='Stu_Voting'),

    
    path('StudentLogOut%s/'%dynamic_url(),StudentLogOut,name='StudentLogOut'),


    path('StudentPromotion/',StudentCandCampaign,name='StudentCandCampaign'),
    path('StudentCandidatePostView/',StudentCandidatePostView,name='StudentCandidatePostView'),
    

]


