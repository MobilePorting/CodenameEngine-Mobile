package funkin.editors;

import funkin.editors.ui.*;

class UIDebugState extends UIState {
    public override function create() {
        super.create();
        var bg = new FlxSprite().makeGraphic(1, 1, 0xFF444444);
        bg.scale.set(FlxG.width, FlxG.height);
        bg.updateHitbox();
        bg.scrollFactor.set();
        add(bg);

        add(new UICheckbox(10, 10, "Test unchecked", false));
        add(new UICheckbox(10, 40, "Test checked", true));
        add(new UIButton(10, 70, "Test button", function() {
            trace("Hello, World!");
        }, 130, 32));
        add(new UIButton(10, 110, "Warning test", function() {
            openSubState(new UIWarningSubstate("Test", "This is a test message", [
                {
                    label: "Alt. Choice",
                    onClick: function(t) {
                        trace("Alt. Choice clicked!");
                    }
                },
                {
                    label: "OK",
                    onClick: function(t) {

                    }
                }
            ]));
        }, 130, 32));
        add(new UIButton(10, 150, "Warning test (Overflowing)", function() {
            openSubState(new UIWarningSubstate("Test", "This is a test message", [
                {
                    label: "Alt. Choice",
                    onClick: function(t) {
                        trace("Alt. Choice clicked!");
                    }
                },
                {
                    label: "OK",
                    onClick: function(t) {}
                },
                {
                    label: "1",
                    onClick: function(t) {}
                },
                {
                    label: "2",
                    onClick: function(t) {}
                },
                {
                    label: "3",
                    onClick: function(t) {}
                },
                {
                    label: "4",
                    onClick: function(t) {}
                }
            ]));
        }, 130, 48));
    }

    public override function update(elapsed:Float) {
        super.update(elapsed);
        if (FlxG.mouse.justReleasedRight) {
            openContextMenu([
                {
                    label: "Test 1",
                    onSelect: function() {

                    }
                },
                {
                    label: "Test 2",
                    onSelect: function() {

                    }
                },
                {
                    label: "Test 3",
                    childs: [
                        {
                            label: "Test 2",
                            onSelect: function() {
        
                            }
                        }
                    ]
                }
            ]);
        }
    }
}