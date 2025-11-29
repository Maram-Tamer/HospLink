import 'dart:math';

/// Vincenty inverse formula (WGS-84) - returns distance in meters.
/// If Vincenty fails to converge, falls back to Haversine.
double calculateDistance({
  required double lat1,
  required double lon1,
  required double lat2,
  required double lon2,
}) {
  // convert degrees to radians
  double toRad(double deg) => deg * pi / 180.0;

  // quick equality check
  if (lat1 == lat2 && lon1 == lon2) return 0.0;

  // WGS-84 ellipsoid params
  const double a = 6378137.0; // major axis (meters)
  const double f = 1 / 298.257223563; // flattening
  const double b = (1 - f) * a; // minor axis

  double phi1 = toRad(lat1);
  double phi2 = toRad(lat2);
  double L = toRad(lon2 - lon1);

  double U1 = atan((1 - f) * tan(phi1));
  double U2 = atan((1 - f) * tan(phi2));

  double sinU1 = sin(U1), cosU1 = cos(U1);
  double sinU2 = sin(U2), cosU2 = cos(U2);

  double lambda = L;
  double lambdaPrev;
  const int maxIter = 200;
  const double tol = 1e-12;

  double sinSigma = 0.0,
      cosSigma = 0.0,
      sigma = 0.0,
      sinAlpha = 0.0,
      cosSqAlpha = 0.0,
      cos2SigmaM = 0.0,
      C = 0.0;

  int iter = 0;
  do {
    double sinLambda = sin(lambda);
    double cosLambda = cos(lambda);

    sinSigma = sqrt(pow((cosU2 * sinLambda), 2) +
        pow((cosU1 * sinU2 - sinU1 * cosU2 * cosLambda), 2));
    if (sinSigma == 0) return 0.0; // co-incident points

    cosSigma = sinU1 * sinU2 + cosU1 * cosU2 * cosLambda;
    sigma = atan2(sinSigma, cosSigma);

    sinAlpha = cosU1 * cosU2 * sinLambda / sinSigma;
    cosSqAlpha = 1 - sinAlpha * sinAlpha;

    // handle equatorial line: cosSqAlpha==0 -> cos2SigmaM = 0 (avoid division by 0)
    cos2SigmaM =
        cosSqAlpha != 0 ? (cosSigma - 2 * sinU1 * sinU2 / cosSqAlpha) : 0.0;

    C = (f / 16) * cosSqAlpha * (4 + f * (4 - 3 * cosSqAlpha));

    lambdaPrev = lambda;
    lambda = L +
        (1 - C) *
            f *
            sinAlpha *
            (sigma +
                C *
                    sinSigma *
                    (cos2SigmaM +
                        C * cosSigma * (-1 + 2 * cos2SigmaM * cos2SigmaM)));

    iter++;
  } while ((lambda - lambdaPrev).abs() > tol && iter < maxIter);

  if (iter >= maxIter) {
    // Vincenty failed to converge — fallback to Haversine (less accurate on ellipsoid)
    return _haversineDistanceMeters(lat1, lon1, lat2, lon2);
  }

  double uSq = cosSqAlpha * (a * a - b * b) / (b * b);
  double A =
      1 + (uSq / 16384) * (4096 + uSq * (-768 + uSq * (320 - 175 * uSq)));
  double B = (uSq / 1024) * (256 + uSq * (-128 + uSq * (74 - 47 * uSq)));

  double deltaSigma = B *
      sinSigma *
      (cos2SigmaM +
          (B / 4) *
              (cosSigma * (-1 + 2 * cos2SigmaM * cos2SigmaM) -
                  (B / 6) *
                      cos2SigmaM *
                      (-3 + 4 * sinSigma * sinSigma) *
                      (-3 + 4 * cos2SigmaM * cos2SigmaM)));

  double s = b * A * (sigma - deltaSigma);

  return s / 1000; // distance in meters
}

/// Haversine fallback (meters)
double _haversineDistanceMeters(
    double lat1, double lon1, double lat2, double lon2) {
  double toRad(double deg) => deg * pi / 180.0;
  const double R = 6371000.0; // Earth radius in meters (mean)
  double dLat = toRad(lat2 - lat1);
  double dLon = toRad(lon2 - lon1);

  double a = sin(dLat / 2) * sin(dLat / 2) +
      cos(toRad(lat1)) * cos(toRad(lat2)) * sin(dLon / 2) * sin(dLon / 2);
  double c = 2 * atan2(sqrt(a), sqrt(1 - a));
  return R * c;
}
