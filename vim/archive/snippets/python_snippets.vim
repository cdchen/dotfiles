if !exists('loaded_snippet') || &cp
  finish
endif

function! PyArgs(text)
  if a:text != "args"
    return ', '.a:text
  else
    return ''
  endif
endfunction

function! PyRemDefVal(text)
  return substitute(a:text,'=.*','','g')
endfunction

function! PyInitVars(text)
  if a:text != "args"
    let text = substitute(a:text,'=.\{-},','','g')
    let text = substitute(text,'=.\{-}$','','g')
    let text = substitute(text,',','','g')
    let ret = ''
    let tabs = indent(".")/&tabstop
    let tab_text = ''
    for i in range(tabs)
      let tab_text = tab_text.'\t'
    endfor
    for Arg in split(text, ' ')
      let ret = ret.'self.'.Arg.' = '.Arg.'\n'.tab_text
    endfor
    return ret
  else
    return "pass"
  endif
endfunction

function! PyCount(haystack, needle)
  let counter = 0
  let index = match(a:haystack, a:needle)
  while index > -1
    let counter = counter + 1
    let index = match(a:haystack, a:needle, index+1)
  endwhile
  return counter
endfunction

function! PyStringFormat(count)
  let st = g:snip_start_tag
  let et = g:snip_end_tag

  if a:count == 0
    return ""
  elseif a:count == 1
    return " % ".st.et
  else
    return ' % ('.join(repeat([st.et], a:count), ', ').')'
  endif
endfunction

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

exec "Snippet py #!/usr/bin/env python<CR># -*- coding: utf-8 -*-<CR>".st.et
exec "Snippet python #!/usr/bin/env python<CR># -*- coding: utf-8 -*-<CR>".st.et
exec "Snippet #! #!/usr/bin/env python<CR>".st.et
exec "Snippet cod # -*- coding: utf-8 -*-".st.et
exec "Snippet doc '''<CR>".st.et."<CR>'''"
exec "Snippet sf '".st."s".et."'".st."s:PyStringFormat(PyCount(@z, '%[^%]'))".et.st.et
exec "Snippet class class ".st."ClassName".et."(".st."object".et."):<CR>def __init__(self".st."args:PyArgs(@z)".et."):<CR>".st."args:PyInitVars(@z)".et.st.et
exec "Snippet . self.".st.et
exec "Snippet .. self.__class__.".st.et
exec "Snippet @@ self.__class__.".st.et
exec "Snippet def def ".st."name".et."(".st.et."):<CR>".st.et
exec "Snippet def** def ".st."name".et."(".st.et.", *args, **kwargs):<CR>".st.et
exec "Snippet defo def ".st."name".et."(self".st."args:PyArgs(@z)".et."):<CR>super(".st.et.", self).".st."name".et."(".st.et.")".st.et
exec "Snippet defo** def ".st."name".et."(self".st."args:PyArgs(@z)".et.", *args, **kwargs):<CR>super(".st.et.", self).".st."name".et."(*args, **kwargs)".st.et
exec "Snippet defs def ".st."name".et."(self".st."args:PyArgs(@z)".et."):<CR>".st.et
exec "Snippet try try:<CR>".st.et."<CR><BS>except ".st.et.":<CR>".st.et
exec "Snippet ifmain if __name__ == '__main__':<CR>".st.et
exec "Snippet if if ".st.et.":<CR>".st.et
exec "Snippet for for ".st."item".et." in ".st."seq".et.":<CR>".st.et
exec "Snippet while while ".st."True".et.":<CR>".st.et
exec "Snippet from from ".st.et." import ".st.et
exec "Snippet super super(".st.et.", self).".st.et
exec "Snippet super** super(".st.et.", self).".st.et."(*args, **kwargs)".st.et
exec "Snippet ass assert 0, ".st.et
exec "Snippet pdb import pdb; pdb.set_trace()".st.et
exec "Snippet ipdb import ipdb; ipdb.set_trace()".st.et
exec "Snippet debug import ipdb; ipdb.set_trace()".st.et
exec "Snippet ipy import IPython; IPython.Shell.IPShell().mainloop()".st.et
exec "Snippet ifdebug if __debug__:<CR>".st.et
exec "Snippet defdec def ".st.et."(func):<CR>from functools import wraps<CR>@wraps(func)<CR>def newfunc(*args, **kwargs):<CR>".st.et."<CR>return func(*args, **kwargs)<CR><BS>return newfunc"

exec "Snippet imdt from datetime import datetime".st.et
exec "Snippet imdec from decimal import Decimal".st.et

exec "Snippet aeq self.assertEqual(".st.et.", ".st.et.")".st.et
exec "Snippet aneq self.assertNotEqual(".st.et.", ".st.et.")".st.et


" -----------------------------------------------------------------------------
" Django Snippets
"
function! Count(haystack, needle)
    let counter = 0
    let index = match(a:haystack, a:needle)
    while index > -1
        let counter = counter + 1
        let index = match(a:haystack, a:needle, index+1)
    endwhile
    return counter
endfunction

function! DjangoArgList(count)
    " This needs to be Python specific as print expects a
    " tuple and an empty tuple looks like this (,) so we'll need to make a
    " special case for it
    let st = g:snip_start_tag
    let et = g:snip_end_tag
    if a:count == 0
        return "()"
    else
        return '('.repeat(st.et.', ', a:count).')'
    endif
endfunction

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

" imports
exec "Snippet dj_ from django.utils.translation import ugettext_lazy as _".st.et
exec "Snippet _ _(u'".st.et."')"
exec "Snippet djconf from django.conf import settings".st.et
exec "Snippet djhttp from django.http import ".st.et
exec "Snippet djtemplate from django import template".st.et
exec "Snippet djmodel from django.db import models".st.et
exec "Snippet djform from django import forms".st.et
exec "Snippet djadmin from django.contrib import admin".st.et
exec "Snippet djor404 from django.shortcuts import get_object_or_404".st.et
exec "Snippet djrender from django.template import RequestContext<CR>from django.shortcuts import render_to_response".st.et
exec "Snippet djurlr from django.core import urlresolvers".st.et
exec "Snippet djurlrr from django.core.urlresolvers import reverse".st.et
exec "Snippet djuser from django.contrib.auth.models import User".st.et
exec "Snippet djtest from django.test import TestCase".st.et
exec "Snippet djcache from django.core.cache import cache".st.et
exec "Snippet djviews from django.views.".st."generic".et." import ".st.et

" url
exec "Snippet urlconf from django.conf.urls.defaults import *<CR>".st.et."<CR><CR>urlpatterns = patterns('',<CR><Tab>url(r'^".st.et."$', ".st.et.", name='".st.et."'),<CR><BS>)"
exec "Snippet url url(r'^".st.et."$', ".st.et.", name='".st.et."'),<CR>".st.et

exec "Snippet view def ".st.et."(request".st."args:PyArgs(@z)".et."):<CR>".st.et
exec "Snippet render return render_to_response('".st.et."', {<CR>".st.et."<CR>}, context_instance=RequestContext(request))"
exec "Snippet modeladmin class ".st."model".et."Admin(admin.ModelAdmin):<CR>list_display = (,)<CR>search_fields = (,)<CR>date_hierarchy = ''<CR><BS><CR>admin.site.register(".st."model".et.", ".st."model".et."Admin)"

" model definition
exec "Snippet model class ".st."modelname".et."(models.Model):<CR>".st.et."<CR><CR>class Meta:<CR>verbose_name = _(u'".st."name".et."')<CR>verbose_name_plural = _(u'".st."name".et.st.et."')<CR><BS><CR>def __unicode__(self):<CR>return self.".st."title".et."<CR><CR><BS>@models.permalink<CR>def get_absolute_url(self):<CR>return '".st.et."', (), {}"
exec "Snippet Meta class Meta:<CR>verbose_name = _(u'".st.et."')<CR>verbose_name_plural = _(u'".st.et."')<CR>ordering = ('".st.et."',)"
exec "Snippet created created = models.DateTimeField(_(u'Created'),<CR><Tab>default=datetime.now, editable=False)".st.et
exec "Snippet modified modified = models.DateTimeField(_(u'Modified'),<CR><Tab>default=datetime.now, editable=False)".st.et

" model fields
exec "Snippet mauto models.AutoField(".st.et.")".st.et
exec "Snippet mbool models.BooleanField(default=".st."True".et.")".st.et
exec "Snippet mchar models.CharField(max_length=".st."50".et.st.et.")".st.et
exec "Snippet mcsi models.CommaSeparatedIntegerField(max_length=".st."50".et.st.et.")".st.et
exec "Snippet mdate models.DateField(".st.et.")".st.et
exec "Snippet mdatet models.DateTimeField(".st.et.")".st.et
exec "Snippet mdatetime models.DateTimeField(".st.et.")".st.et
exec "Snippet memail models.EmailField(".st.et.")".st.et
exec "Snippet mfile models.FileField(upload_to=\"".st.et."\"".st.et.")".st.et
exec "Snippet mfilep models.FilePathField(path=\"".st.et."\"".st.et.")".st.et
exec "Snippet mfloat models.FloatField(max_digits=".st.et.", decimal_places=".st.et.")".st.et
exec "Snippet mdec models.DecimalField(max_digits=".st.et.", decimal_places=".st.et.")".st.et
exec "Snippet mimage models.ImageField(".st.et.")".st.et
exec "Snippet mint models.IntegerField(".st.et.")".st.et
exec "Snippet mipadd models.IPAddressField(".st.et.")".st.et
exec "Snippet mnull models.NullBooleanField()".st.et
exec "Snippet mphone models.PhoneNumberField(".st.et.")".st.et
exec "Snippet mpint models.PositiveIntegerField(".st.et.")".st.et
exec "Snippet mpsint models.PositiveSmallIntegerField(".st.et.")".st.et
exec "Snippet mslug models.SlugField(".st.et."unique=True)".st.et
exec "Snippet msint models.SmallIntegerField(".st.et.")".st.et
exec "Snippet mtext models.TextField(".st.et.")".st.et
exec "Snippet mtime models.TimeField(".st.et.")".st.et
exec "Snippet murl models.URLField(verify_exists=".st."True".et.st.et.")".st.et
exec "Snippet muss models.USStateField(".st.et.")".st.et
exec "Snippet mxml models.XMLField(schema_path=\"".st.et."\"".st.et.")".st.et
exec "Snippet mfor models.ForeignKey(".st.et.")".st.et
exec "Snippet mm2o models.ForeignKey(".st.et.")".st.et
exec "Snippet mm2m models.ManyToManyField(".st.et.")".st.et
exec "Snippet mo2o models.OneToOneField(".st.et.")".st.et
exec "Snippet mman models.Manager()".st.et

" model attributes
exec "Snippet blank null=True, blank=True".st.et
exec "Snippet null null=True".st.et

" form import
exec "Snippet iform from django import forms".st.et
" form definition
exec "Snippet form class ".st.et."(forms.Form):<CR>".st.et."<CR><BS>"
exec "Snippet modelform class ".st.et."(forms.ModelForm):<CR>".st.et."<CR>class Meta:<CR>model = ".st.et."<CR><BS><BS>"
exec "Snippet formsave def save(self, commit=True, *args, **kwargs):<CR>obj = super(".st.et.", self).save(commit=False, *args, **kwargs)<CR>".st.et."<CR>if commit:<CR>obj.save()<CR><BS>return obj"
" form in views
exec "Snippet viewform if request.method == 'POST':<CR>form = ".st."Form".et."(request.POST)<CR>if form.is_valid():<CR>".st.et."<CR>return HttpResponseRedirect(<CR><Tab>urlresolvers.reverse(".st.et."))<CR><BS><BS>else:<CR>form = ".st."Form".et."()"
" newforms fields
exec "Snippet fbool forms.BooleanField(".st.et.")".st.et
exec "Snippet fchar forms.CharField(".st.et.")".st.et
exec "Snippet fdate forms.DateField(".st.et.")".st.et
exec "Snippet fdatet forms.DateTimeField(".st.et.")".st.et
exec "Snippet fdec forms.DecimalField(".st.et.")".st.et
exec "Snippet femail forms.EmailField(".st.et.")".st.et
exec "Snippet ffile forms.FileField(".st.et.")".st.et
exec "Snippet ffilep forms.FilePathField(path=\"".st.et."\"".st.et.")".st.et
exec "Snippet ffloat forms.FloatField(".st.et.")".st.et
exec "Snippet fimage forms.ImageField(".st.et.")".st.et
exec "Snippet fint forms.IntegerField(".st.et.")".st.et
exec "Snippet fipadd forms.IPAddressField(".st.et.")".st.et
exec "Snippet fmulti forms.MultipleChoiceField(".st.et.")".st.et
exec "Snippet fnull forms.NullBooleanField(".st.et.")".st.et
exec "Snippet fregex forms.RegexField(".st.et.")".st.et
exec "Snippet ftime forms.TimeField(".st.et.")".st.et
exec "Snippet furl forms.URLField(verify_exists=".st."True".et.st.et.")".st.et
exec "Snippet fcombo forms.ComboField(".st.et.")".st.et
exec "Snippet fmultival forms.MultiValueField(".st.et.")".st.et
exec "Snippet fsplittime forms.SplitDateTimeField(".st.et.")".st.et
exec "Snippet fmodelmulti forms.ModelMultipleChoiceField(".st.et.")".st.et

" tests
exec "Snippet djtestinit # -*- coding: utf-8 -*-<CR>from django.test import TestCase<CR>from django.test.client import Client<CR>from django.core.urlresolvers import reverse<CR>".st.et
exec "Snippet djtestcase class ".st.et."Test(TestCase):<CR>def setUp(self):<CR>".st.et."<CR><CR><BS>def tearDown(self):<CR>".st."pass".et."<CR><CR><BS>def test".st.et."(self):<CR>".st.et
exec "Snippet clinit self.client = Client()".st.et
exec "Snippet clget response = self.client.get(reverse('".st.et."', args=[".st.et."]), {".st.et."})".st.et
exec "Snippet clget200 response = self.client.get(reverse('".st.et."', args=[".st.et."]), {".st.et."})<CR>self.assertEqual(response.status_code, 200)".st.et
exec "Snippet clpost response = self.client.post(reverse('".st.et."', args=[".st.et."]), {".st.et."})".st.et
exec "Snippet clpost200 response = self.client.post(reverse('".st.et."', args=[".st.et."]), {".st.et."})<CR>self.assertEqual(response.status_code, 200)".st.et
exec "Snippet asscontrue self.assertTrue(response.context[0]['".st.et."'])".st.et
exec "Snippet assconfalse self.assertFalse(response.context[0]['".st.et."'])".st.et
exec "Snippet assconeq self.assertEqual(response.context[0]['".st.et."'], ".st.et.")".st.et
exec "Snippet ass200 self.assertEqual(response.status_code, 200)".st.et
exec "Snippet assre self.assertRedirects(response, reverse('".st.et."'))".st.et
exec "Snippet ass404 self.assertEqual(response.status_code, 404)".st.et
exec "Snippet ass500 self.assertEqual(response.status_code, 500)".st.et
exec "Snippet asscontain self.assertContains(response, ".st.et.")".st.et
exec "Snippet asscontains self.assertContains(response, ".st.et.")".st.et
exec "Snippet assncontain self.assertContains(response, ".st.et.")".st.et
exec "Snippet assncontains self.assertContains(response, ".st.et.")".st.et
exec "Snippet asstemp self.assertTemplateUsed(response, ".st.et.")".st.et
exec "Snippet assntemp self.assertTemplateNotUsed(response, ".st.et.")".st.et

" haystack
exec "Snippet djhay from haystack import indexes<CR>from haystack.sites import site<CR>".st.et
exec "Snippet modelindex class ".st."model".et."Index(indexes.SearchIndex):<CR>text = indexes.CharField(document=True, use_template=True)<CR>".st.et."<CR><CR>def get_query_set(self):<CR>return ".st."model".et.".objects.all()<CR><BS><BS><CR>site.register(".st."model".et.", ".st."model".et."Index)"
exec "Snippet schar indexes.CharField(model_attr='".st.et."')".st.et
exec "Snippet sdatetime indexes.DateTimeField(model_attr='".st.et."')".st.et

" templatetags
exec "Snippet djtags from django import template<CR><CR>register = template.Library()<CR><CR>".st.et
exec "Snippet templatetag class ".st."TagName".et."Node(template.Node):<CR>def __init__(self, ".st."TagAttrs".et."):<CR>".st.et."<CR><BS><CR>def render(self, context):<CR>".st.et."<CR><BS><BS><CR><CR>@register.tag<CR>def ".st.et."(parser, token):<CR>'''<CR>".st.et."<CR>'''<CR>try:<CR>tag_name, ".st.et." = token.split_contents()<CR><BS>except ValueError:<CR>raise template.TemplateSyntaxError(u'%r expects ".st.et." arguments.' % tag_name)<CR><BS>".st.et."<CR>return ".st."TagName".et."Node(".st."TagAttrs".et.")" 
