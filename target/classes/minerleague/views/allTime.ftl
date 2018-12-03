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
            height: 88%;
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
          .table-wrapper-scroll-y {
              display: block;
              max-height: 660px;
              overflow-y: auto;
              -ms-overflow-style: -ms-autohiding-scrollbar;
          }
        </style>
  </head>

  <body>

    <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
            <a class="navbar-brand" href="#">All Time (False Positive Tweets: ${fp} | Sick Tweets: ${sickTweets})</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
              <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                  <a class="nav-link" href="home">Current Day</a>
                </li>
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
                  <a class="nav-link" href="fourWeeks">4 Weeks</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="lostTweets">No Location Tweets</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="allTime">All Tweets</a>
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
        <div class="table-wrapper-scroll-y">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th scope="col">Tweet Text</th>
                  <th scope="col">Twitter Handle</th>
                  <th scope="col">Sick Probability</th>
                  <th scope="col">FP Probability</th>
                </tr>
              </thead>
              <tbody>
                <#list tweetList as tweet>
                    <tr>
                        <td>${tweet.tweetText}</td>
                        <td>${tweet.username}</td>
                        <td>${tweet.sickProbability}</td>
                        <td>${tweet.fpProbability}</td>
                    </tr>
                </#list>
              </tbody>
            </table>
        </div>
        </div>
    </div>

    <script>

      // This example requires the Visualization library. Include the libraries=visualization
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=visualization">

      var map, heatmap;

      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          zoom: 4,
          center: {lat: 39.8333333, lng: -98.585522},
          mapTypeId: 'satellite',
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
          <#list tweetList as tweet>
            new google.maps.LatLng(${tweet.longitude}, ${tweet.latitude}),
          </#list>
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
