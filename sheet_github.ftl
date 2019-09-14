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
                                <div class="item-title"><a href="#">{{ repo.name }}</a></div>
                                <div class="item-meta clearfix">
                                    <div class="item-meta-date">{{ repo.language }}</div>
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
  },
  created () {
    axios.get('https://api.github.com/users/hebingchang/repos')
    .then((response) => {
        this.repos = response.data.filter(repo => !repo.fork).sort(function(a, b) {
            return a.stargazers_count - b.stargazers_count;
        });
    })
    .catch(function (error) {
        console.log(error);
    })
  }
})
</script>
<#include "comment.ftl">
<@comment post=sheet type="sheet" />
<#include "footer.ftl">
