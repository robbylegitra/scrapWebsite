from django.db import models

class Article(models.Model):
    title = models.CharField(max_length=255)
    link = models.URLField(max_length=500)
    post_date = models.CharField(max_length=100)
    content = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title

class Lelang(models.Model):
    kode_lelang = models.CharField(max_length=500)
    nama_paket = models.CharField(max_length=500)
    link = models.URLField(max_length=500)
    instansi = models.CharField(max_length=500)
    tahapan = models.CharField(max_length=500)
    hps = models.CharField(max_length=500)

    class Meta:
        verbose_name = 'Lelang'
        verbose_name_plural = 'Lelang'
