<#include "header.ftl">
<@header title="${post.title!} | ${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}"></@header>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script src="https://unpkg.com/obelisk.js@1.2.2/build/obelisk.min.js"></script>
<script src="https://cdnjs.loli.net/ajax/libs/echarts/4.2.1/echarts.min.js"></script>
<script src="${static!}/source/js/echarts-gl.min.js"></script>

<div id="app" class="main-content archive-page clearfix">
    <div class="categorys-item">
        <div class="categorys-item">
            <div class="categorys-title">Popular Repos</div>
            <div class="post-lists">
                <div class="post-lists-body">
                    <div class="post-list-item" v-for="repo in repos">
                        <div class="post-list-item-container">
                            <div class="item-label">
                                <div class="item-title"><a :href="repo.html_url" target="_blank">{{ repo.name }}</a></div>
                                <div class="item-meta clearfix">
                                    <div class="item-meta-date">{{ repo.language }}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="categorys-item">
            <div class="categorys-title">Contributions in last year</div>
            <div class="post-lists">
                <div class="post-lists-body">
                    <div id="contributions" style="width: 100%; height: 400px;"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${static!}/source/js/github-contrib.js"></script>
<#include "comment.ftl">
<@comment post=sheet type="sheet" />
<#include "footer.ftl">
