from django.conf import settings as S
from django.urls import path
from hello import views
from hello.models import LogMessage

msg_qty = S.LOG_MSG_DISPLAY_COUNT


home_list_view = views.HomeListView.as_view(
    queryset = LogMessage.objects.order_by("-log_date")[:msg_qty],  # :10 limits the results to the 10 most recent
    context_object_name="message_list",
    template_name="hello/home.html",
)


urlpatterns = [
    path("", home_list_view, name="home"),
    path("about/", views.about, name="about"),
    path("contact/", views.contact, name="contact"),
    path("hello/<name>", views.hello_there, name="hello_there"),
    path("log/", views.log_message, name="log"),
]
