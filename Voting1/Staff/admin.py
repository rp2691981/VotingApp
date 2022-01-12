from django.contrib import admin
from .models import StaffLogin,StaffProfile
# Register your models here.


@admin.register(StaffLogin)
class StaffLoginAdmin(admin.ModelAdmin):
    list_display=['UserId','Password','AccountCreated','StaffActive']

@admin.register(StaffProfile)
class StaffLoginAdmin(admin.ModelAdmin):
    list_display=['UserId','Name','Phone','Email','Gender']
