self.addEventListener("install", (event) => {
    console.log("install");
});
self.addEventListener("push", (event) => {
    console.log("push");
});
self.addEventListener("notificationclick", (event) => {
    console.log("notificationclick");
});
self.addEventListener("activate", (event) => {
    console.log("activate");
});
addEventListener("fetch", (event) => {
    console.log("fetch");
});
