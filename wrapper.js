var script = document.createElement('script');
script.onload = function () {
    var conf = $GODOT_CONFIG;
    var executable = conf["executable"];
    conf.mainPack = `${window.JamJar.RootPath}${executable}.pck`
    var engine = new Engine(conf);
    engine.load(`${window.JamJar.RootPath}${executable}`);
    engine.startGame();
};
script.src = `${window.JamJar.RootPath}$GODOT_URL`;
document.head.appendChild(script);
