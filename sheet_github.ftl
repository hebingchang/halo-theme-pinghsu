<#include "header.ftl">
<@header title="${post.title!} | ${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}"></@header>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<div id="app" class="main-content archive-page clearfix">
    <div class="categorys-item">
        <div class="categorys-item">
            <div class="categorys-title">Github Repos</div>
            <div class="post-lists">
                <div class="post-lists-body">
                    <div class="post-list-item" v-for="repo in repos">
                        <div class="post-list-item-container">
                            <div class="item-label">
                                <div class="item-title"><a href="#">title</a></div>
                                <div class="item-meta clearfix">
                                    <div class="item-meta-date"> date </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
var app = new Vue({
  el: '#app',
  data: {
    repos: []
  }
})
</script>
<#include "comment.ftl">
<@comment post=sheet type="sheet" />
<#include "footer.ftl">
