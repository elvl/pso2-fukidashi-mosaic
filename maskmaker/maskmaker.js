"use strict";

$(document).ready(function() {
    MaskMaker.initialize();
});

var MaskMaker = {
    initialize: function() {
        $('#file-drop')
        .on('dragover', function(e) {
            e.preventDefault();
        })
        .on('dragenter', function(e) {
            e.preventDefault();
        })
        .on('drop', this.handleOnDropFile);
        
        $('#parameters input[type="range"]')
        .on('change', this.handleUpdateImage)
        .on('mousemove', this.handleUpdateImage);
        $('#apply').on('click', this.handleUpdateImage);
        $('#preview').hide();
    },
    
    handleUpdateImage: function(e) {
        var self = MaskMaker;
        
        $('#parameters').show();
        $('#image-data').hide();
        $('canvas').show();
        
        if (! self.imageReady) {
            return;
        }
        
        var canvas = $('#overlay').get(0);
        var ctx = canvas.getContext('2d');
        var alpha = 0.8;
        
        if (e.target.id == 'apply' && $(e.target).text() == 'これでよし') {
            alpha = 1.0;
            $('#parameters').hide();
            $('#parameters').show();
            $('canvas').hide();
            $(e.target).text('やりなおす (これでよければ右クリックから画像を保存)');
        }
        else {
            $('#apply').text('これでよし');
        }
        
        ctx.clearRect(0, 0, canvas.width, canvas.height); 
        ctx.fillStyle = 'rgba(0, 0, 0,' + alpha + ')';
        ctx.fillRect(0, 0, canvas.width, canvas.height);
        
        var x = ~~ $('#party-x').val();
        var y = ~~ $('#party-y').val();
        var width = ~~ $('#party-width').val();
        var height = ~~ $('#party-height').val();
        var span = ~~ $('#party-span').val();
        var g = ~~ $('#party-g').val();
        
        self.setGradation(ctx, x, width, g, 240);
        ctx.fillRect(x, canvas.height - y, width, height);
        ctx.fillRect(x, canvas.height - y - (span + height) * 1, width, height);
        ctx.fillRect(x, canvas.height - y - (span + height) * 2, width, height);
        
        x = ~~ $('#my-x').val();
        y = ~~ $('#my-y').val();
        width = ~~ $('#my-width').val();
        height = ~~ $('#my-height').val();
        g = ~~ $('#my-g').val();
        
        self.setGradation(ctx, x, width, g, 240);
        ctx.fillRect(x, canvas.height - y, width, height);
        
        width = ~~ $('#chat-width').val();
        height = ~~ $('#chat-height').val();
        g = ~~ $('#chat-g').val();
        
        var margin = 4;
        x = canvas.width - margin - width;
        y = canvas.height - margin - height;
        self.setGradation(ctx, x, width, g, 120);
        ctx.fillRect(x, y, width, height);
        
        width = ~~ $('#item-width').val();
        x = ~~ $('#item-x').val();
        y = ~~ $('#item-y').val();
        height = 30;
        ctx.fillStyle = 'rgba(255, 255, 255, 1.0)';
        ctx.fillRect(canvas.width / 2 - x, canvas.height - y, width, height);
        
        if (alpha == 1.0) {
            $('#image-data').attr('src', canvas.toDataURL());
            $('#image-data').show();
        }
        
        self.imageReady = true;
    },
    
    setGradation: function(ctx, x, width, g, c) {
        var gradation = ctx.createLinearGradient(x, 0, width + x, 0);
        
        gradation.addColorStop(0, 'rgb(255, 255, 255)');
        gradation.addColorStop(g / 100, 'rgb(255, 255, 255)');
        gradation.addColorStop(g / 100 + (1.0 - g / 100) * 0.4, 'rgb(' + [c, c, c].join(',') + ')');
        gradation.addColorStop(g / 100 + (1.0 - g / 100) * 0.55, 'rgb(90, 90, 90)');
        gradation.addColorStop(g / 100 + (1.0 - g / 100) * 0.7, 'rgb(40, 40, 40)');
        gradation.addColorStop(1.0, 'rgb(0, 0, 0)');
        ctx.fillStyle = gradation;
        
        return ctx
    },
    
    handleOnloadImage: function(file) {
        var self = MaskMaker;
        
        var image;
        image = new Image();
        image.src = file;
        
        image.onload = function() {
            var pcanvas = $('#picture').get(0);
            var ocanvas = $('#overlay').get(0);
            var pctx = pcanvas.getContext('2d');
            var octx = ocanvas.getContext('2d');
            
            octx.width = pctx.width = ocanvas.width = pcanvas.width = image.width;
            octx.height = pctx.height = ocanvas.height = pcanvas.height = image.height;
            pctx.drawImage(image, 0, 0);
            
            self.imageReady = true;
            $('#preview').show();
            $('#image-data').height(octx.height);
            $('#image-data').width(octx.width);
            $('#preview').height(octx.height);
            $('#party-x').change();
        };
    },
    
    handleOnDropFile: function(e) {
        e.preventDefault();
        e.stopPropagation();
        
        var self = MaskMaker;
        var file = e.originalEvent.dataTransfer.files[0];
        
        if (! file.type.match(/^image/)) {
            return;
        }
        
        var reader = new FileReader();
        self.imageReady = false;
        
        reader.onload = function(e){
            self.handleOnloadImage(e.target.result);
        };
        
        reader.readAsDataURL(file);
    },
};
