import{N as w,O as D,P as u}from"./index-203088b8.js";const v="/logs",L=new TextDecoder("utf-8"),M=()=>Math.floor((1+Math.random())*65536).toString(16);let h=!1,i=!1,f="",s,g;function m(e,n){let t;try{t=JSON.parse(e)}catch{console.log("JSON.parse error",JSON.parse(e))}const r=new Date,l=$(r);t.time=l,t.id=+r-0+M(),t.even=h=!h,n(t)}function $(e){const n=e.getFullYear()%100,t=u(e.getMonth()+1,2),r=u(e.getDate(),2),l=u(e.getHours(),2),o=u(e.getMinutes(),2),c=u(e.getSeconds(),2);return`${n}-${t}-${r} ${l}:${o}:${c}`}function p(e,n){return e.read().then(({done:t,value:r})=>{const l=L.decode(r,{stream:!t});f+=l;const o=f.split(`
`),c=o[o.length-1];for(let d=0;d<o.length-1;d++)m(o[d],n);if(t){m(c,n),f="",console.log("GET /logs streaming done"),i=!1;return}else f=c;return p(e,n)})}function S(e){const n=Object.keys(e);return n.sort(),n.map(t=>e[t]).join("|")}let b,a;function k(e,n){if(e.logLevel==="uninit"||i||s&&s.readyState===1)return;g=n;const t=w(e,v);s=new WebSocket(t),s.addEventListener("error",()=>{y(e,n)}),s.addEventListener("message",function(r){m(r.data,n)})}function E(){s.close(),a&&a.abort()}function N(e){!g||!s||(s.close(),i=!1,k(e,g))}function y(e,n){if(a&&S(e)!==b)a.abort();else if(i)return;i=!0,b=S(e),a=new AbortController;const t=a.signal,{url:r,init:l}=D(e);fetch(r+v+"?level="+e.logLevel,{...l,signal:t}).then(o=>{const c=o.body.getReader();p(c,n)},o=>{i=!1,!t.aborted&&console.log("GET /logs error:",o.message)})}export{k as f,N as r,E as s};
