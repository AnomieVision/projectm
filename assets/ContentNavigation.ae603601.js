import{u as d}from"./asyncData.fc05ccd1.js";import{g as l,E as f,k as v,F as p,z as m,G as g,B as h,H as _,q as s}from"./entry.38b5fc9c.js";import{_ as y}from"./nuxt-link.9acd7886.js";const q=l({name:"ContentNavigation",props:{query:{type:Object,required:!1,default:void 0}},async setup(i){const{query:t}=f(i),n=v(()=>{var a;return typeof((a=t.value)==null?void 0:a.params)=="function"?t.value.params():t.value});if(!n.value&&p("dd-navigation").value){const{navigation:a}=m();return{navigation:a}}const{data:o}=await d(`content-navigation-${g(n.value)}`,()=>_(n.value));return{navigation:o}},render(i){const t=h(),{navigation:n}=i,o=e=>s(y,{to:e._path},()=>e.title),a=(e,u)=>s("ul",u?{"data-level":u}:null,e.map(r=>r.children?s("li",null,[o(r),a(r.children,u+1)]):s("li",null,o(r)))),c=e=>a(e,0);return t!=null&&t.default?t.default({navigation:n,...this.$attrs}):c(n)}}),B=q;export{B as default};
