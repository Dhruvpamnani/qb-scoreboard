QBScoreboard = {}

$(document).ready(function(){
    window.addEventListener('message', function(event) {
        switch(event.data.action) {
            case "open":
                QBScoreboard.Open(event.data);
                break;
            case "close":
                QBScoreboard.Close();
                break;
        }
    })
});

QBScoreboard.Open = function(data) {
    $(".scoreboard-block").fadeIn(150);
    $("#total-players").html("<p>"+data.players+"/"+data.maxPlayers+"</p>");
    $("#ogtal3b").html("<p>"+data.ogtal3b+"</p>");

    $.each(data.requiredCops, function(i, category){
        var beam = $(".scoreboard-info").find('[data-type="'+i+'"]');
        var beam1 = $(".scoreboard-info1").find('[data-type="'+i+'"]');
        var status = $(beam).find(".info-beam-status");
        var status1 = $(beam1).find(".info-beam-status1");


        if (category.busy) {
            $(status).html('<i class="fas fa-clock"></i>');
            $(status1).html('<i class="fas fa-clock"></i>');
        } else if (data.currentCops >= category.minimum) {
            $(status).html('<i class="fas fa-lock-open green"></i>');
            $(status1).html('<i class="fas fa-lock-open green"></i>');
        } else {
            $(status).html('<i class="fas fa-lock red"></i>');
            $(status1).html('<i class="fas fa-lock red"></i>');
        }

        if (data.currentAmbulance > 0) {
            var Abeam = $(".scoreboard-info").find('[data-type="ambulance"]');
            var Astatus = $(Abeam).find(".info-beam-status");
            $(Astatus).html('<i class="fas fa-circle green"></i>');
        } else {
            var Abeam = $(".scoreboard-info").find('[data-type="ambulance"]');
            var Astatus = $(Abeam).find(".info-beam-status");
            $(Astatus).html('<i class="fas fa-circle red"></i>');
			
        }
		   if (data.currentrealestate > 0) {
            var Abeam = $(".scoreboard-info").find('[data-type="realestate"]');
            var Astatus = $(Abeam).find(".info-beam-status");
            $(Astatus).html('<i class="fas fa-circle green"></i>');
        } else {
            var Abeam = $(".scoreboard-info").find('[data-type="realestate"]');
            var Astatus = $(Abeam).find(".info-beam-status");
            $(Astatus).html('<i class="fas fa-circle red"></i>');
        }
		
		   if (data.currentcardealer > 0) {
            var Abeam = $(".scoreboard-info").find('[data-type="cardealer"]');
            var Astatus = $(Abeam).find(".info-beam-status");
            $(Astatus).html('<i class="fas fa-circle green"></i>');
        } else {
            var Abeam = $(".scoreboard-info").find('[data-type="cardealer"]');
            var Astatus = $(Abeam).find(".info-beam-status");
            $(Astatus).html('<i class="fas fa-circle red"></i>');
        }
    });
}

QBScoreboard.Close = function() {
    $(".scoreboard-block").fadeOut(150);
}


$(document).ready(function(){
    window.addEventListener('message', function(event) {
        switch(event.data.action) {
            case "open1":
                QBScoreboard.Open1(event.data);
                break;
            case "close1":
                QBScoreboard.Close1();
                break;
        }
    })
});

QBScoreboard.Open1 = function(data) {
    $(".g8dresma-block").fadeIn(0);
    $("#total-players").html("<p>"+data.players+"/"+data.maxPlayers+"</p>");
	$("#total-cops").html("<p>"+data.currentCops+"</p>");
    $("#total-ambs").html("<p>"+data.currentAmbulance+"</p>");
    $("#job").html("<p>"+data.Job+"</p>");
    $("#total-judge").html("<p>"+data.currentJudge+"</p>");
    $("#total-mech").html("<p>"+data.currentMechanic+"</p>");
    $("#total-rs").html("<p>"+data.currentRealestate+"</p>");
    $("#total-card").html("<p>"+data.currentCardealer+"</p>");
    $("#total-taxi").html("<p>"+data.currentTaxi+"</p>");
    $("#total-law").html("<p>"+data.currentLawyer+"</p>");
    $("#total-tow").html("<p>"+data.currentTow+"</p>");
    $("#total-admin").html("<p>"+data.currentAdmin+"</p>");
    $("#Grade").html("<p>"+data.Grade+"</p>");
    $("#Payment").html("<p>"+data.Payment+"</p>");
    $("#Cash").html("<p>"+data.Cash+"</p>");
	$("#Ethereum").html("<p>"+data.Ethereum+"</p>");
    $("#total-crafts").html("<p>"+data.currentCraft+"</p>");
    $("#total-dealers").html("<p>"+data.currentDealer+"</p>");

    $.each(data.requiredCops, function(i, category){
        var beam = $(".stat-info3").find('[data-type="'+i+'"]');
        var status = $(beam).find(".stat-beam-status");


        if (data.currentAmbulance > 0) {
            var Abeam = $(".stat-info3").find('[data-type="ambulance"]');
            var Astatus = $(Abeam).find(".scoreboard-stat-beam3");
        } else {
            var Abeam = $(".stat-info3").find('[data-type="ambulance"]');
            var Astatus = $(Abeam).find(".scoreboard-stat-beam3");
        }
        
        if (data.currentCraft > 0) {
            var Abeam = $(".stat-info2").find('[data-type="craft"]');
            var Astatus = $(Abeam).find(".stat-beam-status2");
            $(Astatus).html('<i class="fas fa-check"></i>');
        } else {
            var Abeam = $(".stat-info2").find('[data-type="craft"]');
            var Astatus = $(Abeam).find(".stat-beam-status2");
            $(Astatus).html('<i class="fas fa-times"></i>');
        }

        if (data.currentDealer > 0) {
            var Abeam = $(".stat-info2").find('[data-type="dealer"]');
            var Astatus = $(Abeam).find(".stat-beam-status2");
            $(Astatus).html('<i class="fas fa-check"></i>');
        } else {
            var Abeam = $(".stat-info2").find('[data-type="dealer"]');
            var Astatus = $(Abeam).find(".stat-beam-status2");
            $(Astatus).html('<i class="fas fa-times"></i>');
        }
        if (data.currentAdmin > 0) {
            var Abeam = $(".stat-info2").find('[data-type="admin"]');
            var Astatus = $(Abeam).find(".stat-beam-status2");
            $(Astatus).html('<i class="fas fa-check"></i>');
        } else {
            var Abeam = $(".stat-info2").find('[data-type="admin"]');
            var Astatus = $(Abeam).find(".stat-beam-status2");
            $(Astatus).html('<i class="fas fa-times"></i>');
        }
	    if (data.currentCops > 0) {
            var Abeam = $(".scoreboard-info").find('[data-type="police"]');
            var Astatus = $(Abeam).find(".info-beam-status10");
            $(Astatus).html("<p>"+data.currentCops+"</p>");
        } else {
            var Abeam = $(".scoreboard-info").find('[data-type="police"]');
            var Astatus = $(Abeam).find(".info-beam-status10");
            $(Astatus).html("<p>"+data.currentCops+"</p>");
        }
    });
}

QBScoreboard.Close1 = function() {
    $(".g8dresma-block").fadeOut(0);
}