from django import forms
from django import forms
from django.http import request
from . models import ElectionPostion


# student Login Create form
class StudentAddForm(forms.Form):
    UserId=forms.CharField(strip=True,widget=forms.TextInput(attrs={'class':'form-control ','placeholder':'Enter UserID'}))
    Password=forms.CharField(strip=True,widget=forms.TextInput(attrs={'class':'form-control','placeholder':'Enter Password'}))






#Candidate Login Create Form
class StaffAddForm(forms.Form):
    UserId=forms.CharField(strip=True,widget=forms.TextInput(attrs={'class':'form-control ','placeholder':'Enter UserID'}))
    Password=forms.CharField(strip=True,widget=forms.TextInput(attrs={'class':'form-control','placeholder':'Enter Password'}))


#Position   for  vote
class AdminPositionelection(forms.Form):
    Position=forms.CharField(strip=True,widget=forms.TextInput(attrs={'class':'form-control ','placeholder':'Enter Position'}))

    
