<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Bare - Start Bootstrap Template</title>

    <!-- Bootstrap core CSS -->
    <link href="/assets/bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <style>
          /* Always set the map height explicitly to define the size of the div
           * element that contains the map. */
          #map {
            height: 100%;
          }
          /* Optional: Makes the sample page fill the window. */
          html, body {
            height: 100%;
            margin: 0;
            padding: 0;
          }
          #floating-panel {
            position: absolute;
            top: 10px;
            left: 25%;
            z-index: 5;
            background-color: #fff;
            padding: 5px;
            border: 1px solid #999;
            text-align: center;
            font-family: 'Roboto','sans-serif';
            line-height: 30px;
            padding-left: 10px;
          }
          #floating-panel {
            background-color: #fff;
            border: 1px solid #999;
            left: 25%;
            padding: 5px;
            position: absolute;
            top: 10px;
            z-index: 5;
          }
          .iframe-container{
              position: relative;
              width: 100%;
              padding-bottom: 35%; /* Ratio 16:9 ( 100%/16*9 = 56.25% ) */
          }
          .iframe-container > *{
              display: block;
              position: absolute;
              top: 0;
              right: 0;
              bottom: 0;
              left: 0;
              margin: 0;
              padding: 0;
              height: 100%;
              width: 100%;
          }
        </style>
  </head>

  <body>

    <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
            <a class="navbar-brand" href="#">MinerLeague (One Week)</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
              <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                  <a class="nav-link" href="oneWeek">1 Week</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="twoWeeks">2 Weeks</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="threeWeeks">3 Weeks</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="home">All Tweets</a>
                </li>
              </ul>
            </div>
        </nav>

    <!-- Page Content -->

    <div class="row h-100">
        <div class="col-sm-6">
            <div id="map"></div>
        </div>
        <div class="col-sm-6">
        <table class="table">
          <thead>
            <tr>
              <th scope="col">Tweet Text</th>
              <th scope="col">Twitter Handle</th>
              <th scope="col">Probability</th>
            </tr>
          </thead>
          <tbody>
            <#list tweetList as tweet>
                <tr>
                    <td>${tweet.tweetText}</td>
                    <td>${tweet.username}</td>
                    <td>${tweet.probability}</td>
                </tr>
            </#list>
          </tbody>
        </table>
        </div>
    </div>

    <script>

      // This example requires the Visualization library. Include the libraries=visualization
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=visualization">

      var map, heatmap;

      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          zoom: 13,
          center: {lat: 37.775, lng: -122.434},
        });

        heatmap = new google.maps.visualization.HeatmapLayer({
          data: getPoints(),
          map: map
        });
      }

      function toggleHeatmap() {
        heatmap.setMap(heatmap.getMap() ? null : map);
      }

      function changeGradient() {
        var gradient = [
          'rgba(0, 255, 255, 0)',
          'rgba(0, 255, 255, 1)',
          'rgba(0, 191, 255, 1)',
          'rgba(0, 127, 255, 1)',
          'rgba(0, 63, 255, 1)',
          'rgba(0, 0, 255, 1)',
          'rgba(0, 0, 223, 1)',
          'rgba(0, 0, 191, 1)',
          'rgba(0, 0, 159, 1)',
          'rgba(0, 0, 127, 1)',
          'rgba(63, 0, 91, 1)',
          'rgba(127, 0, 63, 1)',
          'rgba(191, 0, 31, 1)',
          'rgba(255, 0, 0, 1)'
        ]
        heatmap.set('gradient', heatmap.get('gradient') ? null : gradient);
      }

      function changeRadius() {
        heatmap.set('radius', heatmap.get('radius') ? null : 20);
      }

      function changeOpacity() {
        heatmap.set('opacity', heatmap.get('opacity') ? null : 0.2);
      }

      // Heatmap data: 500 Points
      function getPoints() {
        return [
          new google.maps.LatLng(47.782551, -122.335368),
          new google.maps.LatLng(47.782745, -122.334586),
          new google.maps.LatLng(47.782842, -122.333688),
          new google.maps.LatLng(47.782919, -122.332815),
          new google.maps.LatLng(47.782992, -122.332112),
          new google.maps.LatLng(47.783100, -122.331461),
          new google.maps.LatLng(47.783206, -122.330829),
          new google.maps.LatLng(47.783273, -122.330324),
          new google.maps.LatLng(47.783316, -122.330023),
          new google.maps.LatLng(47.783357, -122.339794),
          new google.maps.LatLng(47.783371, -122.339687),
          new google.maps.LatLng(47.783368, -122.339666),
          new google.maps.LatLng(47.783383, -122.339594),
          new google.maps.LatLng(47.783508, -122.339525),
          new google.maps.LatLng(47.783842, -122.339591),
          new google.maps.LatLng(47.784147, -122.339668),
          new google.maps.LatLng(47.784206, -122.339686),
          new google.maps.LatLng(47.784386, -122.339790),
          new google.maps.LatLng(47.784701, -122.339902),
          new google.maps.LatLng(47.784965, -122.339938),
          new google.maps.LatLng(47.785010, -122.339947),
          new google.maps.LatLng(47.785360, -122.339952),
          new google.maps.LatLng(47.785715, -122.330030),
          new google.maps.LatLng(47.786117, -122.330119),
          new google.maps.LatLng(47.786564, -122.330209),
          new google.maps.LatLng(47.786905, -122.330270),
          new google.maps.LatLng(47.786956, -122.330279),
          new google.maps.LatLng(47.800224, -122.333520),
          new google.maps.LatLng(47.800155, -122.334101),
          new google.maps.LatLng(47.800160, -122.334430),
          new google.maps.LatLng(47.800378, -122.334527),
          new google.maps.LatLng(47.800738, -122.334598),
          new google.maps.LatLng(47.800938, -122.334650),
          new google.maps.LatLng(47.801024, -122.334889),
          new google.maps.LatLng(47.800955, -122.335392),
          new google.maps.LatLng(47.800886, -122.335959),
          new google.maps.LatLng(47.800811, -122.336275),
          new google.maps.LatLng(47.800788, -122.336299),
          new google.maps.LatLng(47.800719, -122.336302),
          new google.maps.LatLng(47.800702, -122.336298),
          new google.maps.LatLng(47.800661, -122.336273),
          new google.maps.LatLng(47.800395, -122.336172),
          new google.maps.LatLng(47.800228, -122.336116),
          new google.maps.LatLng(47.800169, -122.336130),
          new google.maps.LatLng(47.800066, -122.336167),
          new google.maps.LatLng(47.784345, -122.332922),
          new google.maps.LatLng(47.784389, -122.332926),
          new google.maps.LatLng(47.784437, -122.332924),
          new google.maps.LatLng(47.784746, -122.332818),
          new google.maps.LatLng(47.785436, -122.332959),
          new google.maps.LatLng(47.786120, -122.333112),

          new google.maps.LatLng(37.786433, -122.423029),
          new google.maps.LatLng(37.786631, -122.421213),
          new google.maps.LatLng(37.786660, -122.421033),
          new google.maps.LatLng(37.786801, -122.420141),
          new google.maps.LatLng(37.786823, -122.420034),
          new google.maps.LatLng(37.786831, -122.419916),
          new google.maps.LatLng(37.787034, -122.418208),
          new google.maps.LatLng(37.787056, -122.418034),
          new google.maps.LatLng(37.787169, -122.417145),
          new google.maps.LatLng(37.787217, -122.416715),
          new google.maps.LatLng(37.786144, -122.416403),
          new google.maps.LatLng(37.785292, -122.416257),
          new google.maps.LatLng(37.780666, -122.390374),
          new google.maps.LatLng(37.780501, -122.391281),
          new google.maps.LatLng(37.780148, -122.392052),
          new google.maps.LatLng(37.780173, -122.391148),
          new google.maps.LatLng(37.780693, -122.390592),
          new google.maps.LatLng(37.781261, -122.391142),
          new google.maps.LatLng(37.781808, -122.391730),
          new google.maps.LatLng(37.782340, -122.392341),
          new google.maps.LatLng(37.782812, -122.393022),
          new google.maps.LatLng(37.783300, -122.393672),
          new google.maps.LatLng(37.783809, -122.394275),
          new google.maps.LatLng(37.784246, -122.394979),
          new google.maps.LatLng(37.784791, -122.395958),
          new google.maps.LatLng(37.785675, -122.396746),
          new google.maps.LatLng(37.786262, -122.395780),
          new google.maps.LatLng(37.786776, -122.395093),
          new google.maps.LatLng(37.787282, -122.394426),
          new google.maps.LatLng(37.787783, -122.393767),
          new google.maps.LatLng(37.788343, -122.393184),
          new google.maps.LatLng(37.788895, -122.392506),
          new google.maps.LatLng(37.789371, -122.391701),
          new google.maps.LatLng(37.789722, -122.390952),
          new google.maps.LatLng(37.790315, -122.390305),
          new google.maps.LatLng(37.790738, -122.389616),
          new google.maps.LatLng(37.779448, -122.438702),
          new google.maps.LatLng(37.779023, -122.438585),
          new google.maps.LatLng(37.778542, -122.438492),
          new google.maps.LatLng(37.778100, -122.438411),
          new google.maps.LatLng(37.777986, -122.438376),
          new google.maps.LatLng(37.777680, -122.438313),
          new google.maps.LatLng(37.777316, -122.438273),
          new google.maps.LatLng(37.777135, -122.438254),
          new google.maps.LatLng(37.776987, -122.438303),
          new google.maps.LatLng(37.776946, -122.438404),
          new google.maps.LatLng(37.776944, -122.438467),
          new google.maps.LatLng(37.776892, -122.438459),
          new google.maps.LatLng(37.776842, -122.438442),
          new google.maps.LatLng(37.776822, -122.438391),
          new google.maps.LatLng(37.776814, -122.438412),
          new google.maps.LatLng(37.776787, -122.438628),
          new google.maps.LatLng(37.776729, -122.438650),
          new google.maps.LatLng(37.776759, -122.438677),
          new google.maps.LatLng(37.776772, -122.438498),
          new google.maps.LatLng(37.776787, -122.438389),
          new google.maps.LatLng(37.776848, -122.438283),
          new google.maps.LatLng(37.776870, -122.438239),
          new google.maps.LatLng(37.777015, -122.438198),
          new google.maps.LatLng(37.777333, -122.438256),
          new google.maps.LatLng(37.777595, -122.438308),
          new google.maps.LatLng(37.777797, -122.438344),
          new google.maps.LatLng(37.778160, -122.438442),
          new google.maps.LatLng(37.778414, -122.438508),
          new google.maps.LatLng(37.778445, -122.438516),
          new google.maps.LatLng(37.778503, -122.438529),
          new google.maps.LatLng(37.778607, -122.438549),
          new google.maps.LatLng(37.778670, -122.438644),
          new google.maps.LatLng(37.778847, -122.438706),
          new google.maps.LatLng(37.779240, -122.438744),
          new google.maps.LatLng(37.779738, -122.438822),
          new google.maps.LatLng(37.780201, -122.438882),
          new google.maps.LatLng(37.780400, -122.438905),
          new google.maps.LatLng(37.780501, -122.438921),
          new google.maps.LatLng(37.780892, -122.438986),
          new google.maps.LatLng(37.781446, -122.439087),
          new google.maps.LatLng(37.781985, -122.439199),
          new google.maps.LatLng(37.782239, -122.439249),
          new google.maps.LatLng(37.782286, -122.439266),
          new google.maps.LatLng(37.797847, -122.429388),
          new google.maps.LatLng(37.797874, -122.429180),
          new google.maps.LatLng(37.797885, -122.429069),
          new google.maps.LatLng(37.797887, -122.429050),
          new google.maps.LatLng(37.797933, -122.428954),
          new google.maps.LatLng(37.798242, -122.428990),
          new google.maps.LatLng(37.798617, -122.429075),
          new google.maps.LatLng(37.798719, -122.429092),
          new google.maps.LatLng(37.798944, -122.429145),
          new google.maps.LatLng(37.799320, -122.429251),
          new google.maps.LatLng(37.799590, -122.429309),
          new google.maps.LatLng(37.799677, -122.429324),
          new google.maps.LatLng(37.799966, -122.429360),
          new google.maps.LatLng(37.800288, -122.429430),
          new google.maps.LatLng(37.800443, -122.429461),
          new google.maps.LatLng(37.800465, -122.429474),
          new google.maps.LatLng(37.800644, -122.429540),
          new google.maps.LatLng(37.800948, -122.429620),
          new google.maps.LatLng(37.801242, -122.429685),
          new google.maps.LatLng(37.801375, -122.429702),
          new google.maps.LatLng(37.801400, -122.429703),
          new google.maps.LatLng(37.801453, -122.429707),
          new google.maps.LatLng(37.801473, -122.429709),
          new google.maps.LatLng(37.801532, -122.429707),
          new google.maps.LatLng(37.801852, -122.429729),
          new google.maps.LatLng(37.802173, -122.429789),
          new google.maps.LatLng(37.802459, -122.429847),
          new google.maps.LatLng(37.802554, -122.429825),
          new google.maps.LatLng(37.802647, -122.429549),
          new google.maps.LatLng(37.802693, -122.429179),
          new google.maps.LatLng(37.802729, -122.428751),
          new google.maps.LatLng(37.766104, -122.409291),
          new google.maps.LatLng(37.766103, -122.409268),
          new google.maps.LatLng(37.766138, -122.409229),
          new google.maps.LatLng(37.766183, -122.409231),
          new google.maps.LatLng(37.766153, -122.409276),
          new google.maps.LatLng(37.766005, -122.409365),
          new google.maps.LatLng(37.765897, -122.409570),
          new google.maps.LatLng(37.765767, -122.409739),
          new google.maps.LatLng(37.765693, -122.410389),
          new google.maps.LatLng(37.765615, -122.411201),
          new google.maps.LatLng(37.765533, -122.412121),
          new google.maps.LatLng(37.765467, -122.412939),
          new google.maps.LatLng(37.765444, -122.414821),
          new google.maps.LatLng(37.765444, -122.414964),
          new google.maps.LatLng(37.765318, -122.415424),
          new google.maps.LatLng(37.763961, -122.415296),
          new google.maps.LatLng(37.763115, -122.415196),
          new google.maps.LatLng(37.762967, -122.415183),
          new google.maps.LatLng(37.762278, -122.415127),
          new google.maps.LatLng(37.761675, -122.415055),
          new google.maps.LatLng(37.760932, -122.414988),
          new google.maps.LatLng(37.759337, -122.414862),
          new google.maps.LatLng(37.773187, -122.421922),
          new google.maps.LatLng(37.773043, -122.422118),
          new google.maps.LatLng(37.773007, -122.422165),
          new google.maps.LatLng(37.772979, -122.422219),
          new google.maps.LatLng(37.772865, -122.422394),
          new google.maps.LatLng(37.772779, -122.422503),
          new google.maps.LatLng(37.772676, -122.422701),
          new google.maps.LatLng(37.772606, -122.422806),
          new google.maps.LatLng(37.772566, -122.422840),
          new google.maps.LatLng(37.772508, -122.422852),
          new google.maps.LatLng(37.772387, -122.423011),
          new google.maps.LatLng(37.772099, -122.423328),
          new google.maps.LatLng(37.771704, -122.423783),
          new google.maps.LatLng(37.771481, -122.424081),
          new google.maps.LatLng(37.771400, -122.424179),
          new google.maps.LatLng(37.771352, -122.424220),
          new google.maps.LatLng(37.771248, -122.424327),
          new google.maps.LatLng(37.770904, -122.424781),
          new google.maps.LatLng(37.770520, -122.425283),
          new google.maps.LatLng(37.770337, -122.425553),
          new google.maps.LatLng(37.770128, -122.425832),
          new google.maps.LatLng(37.769756, -122.426331),
          new google.maps.LatLng(37.769300, -122.426902),
          new google.maps.LatLng(37.769132, -122.427065),
          new google.maps.LatLng(37.769092, -122.427103),
          new google.maps.LatLng(37.768979, -122.427172),
          new google.maps.LatLng(37.768595, -122.427634),
          new google.maps.LatLng(37.768372, -122.427913),
          new google.maps.LatLng(37.768337, -122.427961),
          new google.maps.LatLng(37.768244, -122.428138),
          new google.maps.LatLng(37.767942, -122.428581),
          new google.maps.LatLng(37.767482, -122.429094),
          new google.maps.LatLng(37.767031, -122.429606),
          new google.maps.LatLng(37.766732, -122.429986),
          new google.maps.LatLng(37.766680, -122.430058),
          new google.maps.LatLng(37.766633, -122.430109),
          new google.maps.LatLng(37.766580, -122.430211),
          new google.maps.LatLng(37.766367, -122.430594),
          new google.maps.LatLng(37.765910, -122.431137),
          new google.maps.LatLng(37.765353, -122.431806),
          new google.maps.LatLng(37.764962, -122.432298),
          new google.maps.LatLng(37.764868, -122.432486),
          new google.maps.LatLng(37.764518, -122.432913),
          new google.maps.LatLng(37.763435, -122.434173),
          new google.maps.LatLng(37.762847, -122.434953),
          new google.maps.LatLng(37.762291, -122.435935),
          new google.maps.LatLng(37.762224, -122.436074),
          new google.maps.LatLng(37.761957, -122.436892),
          new google.maps.LatLng(37.761652, -122.438886),
          new google.maps.LatLng(37.761284, -122.439955),
          new google.maps.LatLng(37.761210, -122.440068),
          new google.maps.LatLng(37.761064, -122.440720),
          new google.maps.LatLng(37.761040, -122.441411),
          new google.maps.LatLng(37.761048, -122.442324),
          new google.maps.LatLng(37.760851, -122.443118),
          new google.maps.LatLng(37.759977, -122.444591),
          new google.maps.LatLng(37.759913, -122.444698),
          new google.maps.LatLng(37.759623, -122.445065),
          new google.maps.LatLng(37.758902, -122.445158),
          new google.maps.LatLng(37.758428, -122.444570),
          new google.maps.LatLng(37.757687, -122.443340),
          new google.maps.LatLng(37.757583, -122.443240),
          new google.maps.LatLng(37.757019, -122.442787),
          new google.maps.LatLng(37.756603, -122.442322),
          new google.maps.LatLng(37.756380, -122.441602),
          new google.maps.LatLng(37.755790, -122.441382),
          new google.maps.LatLng(37.754493, -122.442133),
          new google.maps.LatLng(37.754361, -122.442206),
          new google.maps.LatLng(37.753719, -122.442650),
          new google.maps.LatLng(37.753096, -122.442915),
          new google.maps.LatLng(37.751617, -122.443211),
          new google.maps.LatLng(37.751496, -122.443246),
          new google.maps.LatLng(37.750733, -122.443428),
          new google.maps.LatLng(37.750126, -122.443536),
          new google.maps.LatLng(37.750103, -122.443784),
          new google.maps.LatLng(37.750390, -122.444010),
          new google.maps.LatLng(37.750448, -122.444013),
          new google.maps.LatLng(37.750536, -122.444040),
          new google.maps.LatLng(37.750493, -122.444141),
          new google.maps.LatLng(37.790859, -122.402808),
          new google.maps.LatLng(37.790864, -122.402768),
          new google.maps.LatLng(37.790995, -122.402539),
          new google.maps.LatLng(37.791148, -122.402172),
          new google.maps.LatLng(37.791385, -122.401312),
          new google.maps.LatLng(37.791405, -122.400776),
          new google.maps.LatLng(37.791288, -122.400528),
          new google.maps.LatLng(37.791113, -122.400441),
          new google.maps.LatLng(37.791027, -122.400395),
          new google.maps.LatLng(37.791094, -122.400311),
          new google.maps.LatLng(37.791211, -122.400183),
          new google.maps.LatLng(37.791060, -122.399334),
          new google.maps.LatLng(37.790538, -122.398718),
          new google.maps.LatLng(37.790095, -122.398086),
          new google.maps.LatLng(37.789644, -122.397360),
          new google.maps.LatLng(37.789254, -122.396844),
          new google.maps.LatLng(37.788855, -122.396397),
          new google.maps.LatLng(37.788483, -122.395963),
          new google.maps.LatLng(37.788015, -122.395365),
          new google.maps.LatLng(37.787558, -122.394735),
          new google.maps.LatLng(37.787472, -122.394323),
          new google.maps.LatLng(37.787630, -122.394025),
          new google.maps.LatLng(37.787767, -122.393987),
          new google.maps.LatLng(37.787486, -122.394452),
          new google.maps.LatLng(37.786977, -122.395043),
          new google.maps.LatLng(37.786583, -122.395552),
          new google.maps.LatLng(37.786540, -122.395610),
          new google.maps.LatLng(37.786516, -122.395659),
          new google.maps.LatLng(37.786378, -122.395707),
          new google.maps.LatLng(37.786044, -122.395362),
          new google.maps.LatLng(37.785598, -122.394715),
          new google.maps.LatLng(37.785321, -122.394361),
          new google.maps.LatLng(37.785207, -122.394236),
          new google.maps.LatLng(37.785751, -122.394062),
          new google.maps.LatLng(37.785996, -122.393881),
          new google.maps.LatLng(37.786092, -122.393830),
          new google.maps.LatLng(37.785998, -122.393899),
          new google.maps.LatLng(37.785114, -122.394365),
          new google.maps.LatLng(37.785022, -122.394441),
          new google.maps.LatLng(37.784823, -122.394635),
          new google.maps.LatLng(37.784719, -122.394629),
          new google.maps.LatLng(37.785069, -122.394176),
          new google.maps.LatLng(37.785500, -122.393650),
          new google.maps.LatLng(37.785770, -122.393291),
          new google.maps.LatLng(37.785839, -122.393159),
          new google.maps.LatLng(37.782651, -122.400628),
          new google.maps.LatLng(37.782616, -122.400599),
          new google.maps.LatLng(37.782702, -122.400470),
          new google.maps.LatLng(37.782915, -122.400192),
          new google.maps.LatLng(37.783137, -122.399887),
          new google.maps.LatLng(37.783414, -122.399519),
          new google.maps.LatLng(37.783629, -122.399237),
          new google.maps.LatLng(37.783688, -122.399157),
          new google.maps.LatLng(37.783716, -122.399106),
          new google.maps.LatLng(37.783798, -122.399072),
          new google.maps.LatLng(37.783997, -122.399186),
          new google.maps.LatLng(37.784271, -122.399538),
          new google.maps.LatLng(37.784577, -122.399948),
          new google.maps.LatLng(37.784828, -122.400260),
          new google.maps.LatLng(37.784999, -122.400477),
          new google.maps.LatLng(37.785113, -122.400651),
          new google.maps.LatLng(37.785155, -122.400703),
          new google.maps.LatLng(37.785192, -122.400749),
          new google.maps.LatLng(37.785278, -122.400839),
          new google.maps.LatLng(37.785387, -122.400857),
          new google.maps.LatLng(37.785478, -122.400890),
          new google.maps.LatLng(37.785526, -122.401022),
          new google.maps.LatLng(37.785598, -122.401148),
          new google.maps.LatLng(37.785631, -122.401202),
          new google.maps.LatLng(37.785660, -122.401267),
          new google.maps.LatLng(37.803986, -122.426035),
          new google.maps.LatLng(37.804102, -122.425089),
          new google.maps.LatLng(37.804211, -122.424156),
          new google.maps.LatLng(37.803861, -122.423385),
          new google.maps.LatLng(37.803151, -122.423214),
          new google.maps.LatLng(37.802439, -122.423077),
          new google.maps.LatLng(37.801740, -122.422905),
          new google.maps.LatLng(37.801069, -122.422785),
          new google.maps.LatLng(37.800345, -122.422649),
          new google.maps.LatLng(37.799633, -122.422603),
          new google.maps.LatLng(37.799750, -122.421700),
          new google.maps.LatLng(37.799885, -122.420854),
          new google.maps.LatLng(37.799209, -122.420607),
          new google.maps.LatLng(37.795656, -122.400395),
          new google.maps.LatLng(37.795203, -122.400304),
          new google.maps.LatLng(37.778738, -122.415584),
          new google.maps.LatLng(37.778812, -122.415189),
          new google.maps.LatLng(37.778824, -122.415092),
          new google.maps.LatLng(37.778833, -122.414932),
          new google.maps.LatLng(37.778834, -122.414898),
          new google.maps.LatLng(37.778740, -122.414757),
          new google.maps.LatLng(37.778501, -122.414433),
          new google.maps.LatLng(37.778182, -122.414026),
          new google.maps.LatLng(37.777851, -122.413623),
          new google.maps.LatLng(37.777486, -122.413166),
          new google.maps.LatLng(37.777109, -122.412674),
          new google.maps.LatLng(37.776743, -122.412186),
          new google.maps.LatLng(37.776440, -122.411800),
          new google.maps.LatLng(37.776295, -122.411614),
          new google.maps.LatLng(37.776158, -122.411440),
          new google.maps.LatLng(37.775806, -122.410997),
          new google.maps.LatLng(37.775422, -122.410484),
          new google.maps.LatLng(37.775126, -122.410087),
          new google.maps.LatLng(37.775012, -122.409854),
          new google.maps.LatLng(37.775164, -122.409573),
          new google.maps.LatLng(37.775498, -122.409180),
          new google.maps.LatLng(37.775868, -122.408730),
          new google.maps.LatLng(37.776256, -122.408240),
          new google.maps.LatLng(37.776519, -122.407928),
          new google.maps.LatLng(37.776539, -122.407904),
          new google.maps.LatLng(37.776595, -122.407854),
          new google.maps.LatLng(37.776853, -122.407547),
          new google.maps.LatLng(37.777234, -122.407087),
          new google.maps.LatLng(37.777644, -122.406558),
          new google.maps.LatLng(37.778066, -122.406017),
          new google.maps.LatLng(37.778468, -122.405499),
          new google.maps.LatLng(37.778866, -122.404995),
          new google.maps.LatLng(37.779295, -122.404455),
          new google.maps.LatLng(37.779695, -122.403950),
          new google.maps.LatLng(37.779982, -122.403584),
          new google.maps.LatLng(37.780295, -122.403223),
          new google.maps.LatLng(37.780664, -122.402766),
          new google.maps.LatLng(37.781043, -122.402288),
          new google.maps.LatLng(37.781399, -122.401823),
          new google.maps.LatLng(37.781727, -122.401407),
          new google.maps.LatLng(37.781853, -122.401247),
          new google.maps.LatLng(37.781894, -122.401195),
          new google.maps.LatLng(37.782076, -122.400977),
          new google.maps.LatLng(37.782338, -122.400603),
          new google.maps.LatLng(37.782666, -122.400133),
          new google.maps.LatLng(37.783048, -122.399634),
          new google.maps.LatLng(37.783450, -122.399198),
          new google.maps.LatLng(37.783791, -122.398998),
          new google.maps.LatLng(37.784177, -122.398959),
          new google.maps.LatLng(37.784388, -122.398971),
          new google.maps.LatLng(37.784404, -122.399128),
          new google.maps.LatLng(37.784586, -122.399524),
          new google.maps.LatLng(37.784835, -122.399927),
          new google.maps.LatLng(37.785116, -122.400307),
          new google.maps.LatLng(37.785282, -122.400539),
          new google.maps.LatLng(37.785346, -122.400692),
          new google.maps.LatLng(37.765769, -122.407201),
          new google.maps.LatLng(37.765790, -122.407414),
          new google.maps.LatLng(37.765802, -122.407755),
          new google.maps.LatLng(37.765791, -122.408219),
          new google.maps.LatLng(37.765763, -122.408759),
          new google.maps.LatLng(37.765726, -122.409348),
          new google.maps.LatLng(37.765716, -122.409882),
          new google.maps.LatLng(37.765708, -122.410202),
          new google.maps.LatLng(37.765705, -122.410253),
          new google.maps.LatLng(37.765707, -122.410369),
          new google.maps.LatLng(37.765692, -122.410720),
          new google.maps.LatLng(37.765699, -122.411215),
          new google.maps.LatLng(37.765687, -122.411789),
          new google.maps.LatLng(37.765666, -122.412373),
          new google.maps.LatLng(37.765598, -122.412883),
          new google.maps.LatLng(37.765543, -122.413039),
          new google.maps.LatLng(37.765532, -122.413125),
          new google.maps.LatLng(37.765500, -122.413553),
          new google.maps.LatLng(37.765448, -122.414053),
          new google.maps.LatLng(37.765388, -122.414645),
          new google.maps.LatLng(37.765323, -122.415250),
          new google.maps.LatLng(37.765303, -122.415847),
          new google.maps.LatLng(37.765251, -122.416439),
          new google.maps.LatLng(37.765204, -122.417020),
          new google.maps.LatLng(37.765172, -122.417556),
          new google.maps.LatLng(37.765164, -122.418075),
          new google.maps.LatLng(37.765153, -122.418618),
          new google.maps.LatLng(37.765136, -122.419112),
          new google.maps.LatLng(37.765129, -122.419378),
          new google.maps.LatLng(37.765119, -122.419481),
          new google.maps.LatLng(37.765100, -122.419852),
          new google.maps.LatLng(37.765083, -122.420349),
          new google.maps.LatLng(37.765045, -122.420930),
          new google.maps.LatLng(37.764992, -122.421481),
          new google.maps.LatLng(37.764980, -122.421695),
          new google.maps.LatLng(37.764993, -122.421843),
          new google.maps.LatLng(37.764986, -122.422255),
          new google.maps.LatLng(37.764975, -122.422823),
          new google.maps.LatLng(37.764939, -122.423411),
          new google.maps.LatLng(37.764902, -122.424014),
          new google.maps.LatLng(37.764853, -122.424576),
          new google.maps.LatLng(37.764826, -122.424922),
          new google.maps.LatLng(37.764796, -122.425375),
          new google.maps.LatLng(37.764782, -122.425869),
          new google.maps.LatLng(37.764768, -122.426089),
          new google.maps.LatLng(37.764766, -122.426117),
          new google.maps.LatLng(37.764723, -122.426276),
          new google.maps.LatLng(37.764681, -122.426649),
          new google.maps.LatLng(37.782012, -122.404200),
          new google.maps.LatLng(37.781574, -122.404911),
          new google.maps.LatLng(37.781055, -122.405597),
          new google.maps.LatLng(37.780479, -122.406341),
          new google.maps.LatLng(37.779996, -122.406939),
          new google.maps.LatLng(37.779459, -122.407613),
          new google.maps.LatLng(37.778953, -122.408228),
          new google.maps.LatLng(37.778409, -122.408839),
          new google.maps.LatLng(37.777842, -122.409501),
          new google.maps.LatLng(37.777334, -122.410181),
          new google.maps.LatLng(37.776809, -122.410836),
          new google.maps.LatLng(37.776240, -122.411514),
          new google.maps.LatLng(37.775725, -122.412145),
          new google.maps.LatLng(37.775190, -122.412805),
          new google.maps.LatLng(37.774672, -122.413464),
          new google.maps.LatLng(37.774084, -122.414186),
          new google.maps.LatLng(37.773533, -122.413636),
          new google.maps.LatLng(37.773021, -122.413009),
          new google.maps.LatLng(37.772501, -122.412371),
          new google.maps.LatLng(37.771964, -122.411681),
          new google.maps.LatLng(37.771479, -122.411078),
          new google.maps.LatLng(37.770992, -122.410477),
          new google.maps.LatLng(37.770467, -122.409801),
          new google.maps.LatLng(37.770090, -122.408904),
          new google.maps.LatLng(37.769657, -122.408103),
          new google.maps.LatLng(37.769132, -122.407276),
          new google.maps.LatLng(37.768564, -122.406469),
          new google.maps.LatLng(37.767980, -122.405745),
          new google.maps.LatLng(37.767380, -122.405299),
          new google.maps.LatLng(37.766604, -122.405297),
          new google.maps.LatLng(37.765838, -122.405200),
          new google.maps.LatLng(37.765139, -122.405139),
          new google.maps.LatLng(37.764457, -122.405094),
          new google.maps.LatLng(37.763716, -122.405142),
          new google.maps.LatLng(37.762932, -122.405398),
          new google.maps.LatLng(37.762126, -122.405813),
          new google.maps.LatLng(37.761344, -122.406215),
          new google.maps.LatLng(37.760556, -122.406495),
          new google.maps.LatLng(37.759732, -122.406484),
          new google.maps.LatLng(37.758910, -122.406228),
          new google.maps.LatLng(37.758182, -122.405695),
          new google.maps.LatLng(37.757676, -122.405118),
          new google.maps.LatLng(37.757039, -122.404346),
          new google.maps.LatLng(37.756335, -122.403719),
          new google.maps.LatLng(37.755503, -122.403406),
          new google.maps.LatLng(37.754665, -122.403242),
          new google.maps.LatLng(37.753837, -122.403172),
          new google.maps.LatLng(37.752986, -122.403112),
          new google.maps.LatLng(37.751266, -122.403355)
        ];
      }
    </script>

    <!-- Bootstrap core JavaScript -->
            <script src="/assets/bootstrap/vendor/jquery/jquery.min.js"></script>
            <script src="/assets/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCwoGmL8ozftsgLJ1esZPnPCMHqMwoWL6s&libraries=visualization&callback=initMap">
    </script>



  </body>

</html>