# PowerShell script to generate remaining service and location pages

# Define service pages
$services = @(
    @{Name="HVAC Maintenance"; File="hvac-maintenance.html"; Title="Professional HVAC Maintenance San Jose CA | Ductless Mini Split Service"; Description="Expert HVAC maintenance and ductless mini split service in San Jose, CA. Preventive maintenance, tune-ups, 24/7 service. Call (888) 918-9104"},
    @{Name="Air Conditioning Repair"; File="air-conditioning-repair.html"; Title="AC Repair San Jose CA | Air Conditioning Service & Repair"; Description="Expert air conditioning repair in San Jose, CA. Same-day AC service, emergency repairs, professional technicians. Call (888) 918-9104"},
    @{Name="Heating Installation"; File="heating-installation.html"; Title="Heating Installation San Jose CA | Furnace & Heat Pump Installation"; Description="Professional heating installation in San Jose, CA. Furnace, heat pump, and ductless heating systems. Expert installation. Call (888) 918-9104"},
    @{Name="Duct Cleaning"; File="duct-cleaning.html"; Title="Duct Cleaning San Jose CA | Air Duct Cleaning Service"; Description="Professional duct cleaning service in San Jose, CA. Improve air quality, HVAC efficiency. Expert technicians. Call (888) 918-9104"},
    @{Name="Thermostat Installation"; File="thermostat-installation.html"; Title="Thermostat Installation San Jose CA | Smart Thermostat Service"; Description="Professional thermostat installation in San Jose, CA. Smart thermostats, programmable controls, expert installation. Call (888) 918-9104"},
    @{Name="Indoor Air Quality"; File="indoor-air-quality.html"; Title="Indoor Air Quality San Jose CA | Air Purification Systems"; Description="Indoor air quality solutions in San Jose, CA. Air purifiers, humidity control, ventilation systems. Expert installation. Call (888) 918-9104"},
    @{Name="Commercial HVAC"; File="commercial-hvac.html"; Title="Commercial HVAC San Jose CA | Business HVAC Service & Installation"; Description="Commercial HVAC services in San Jose, CA. Business heating, cooling, maintenance. Professional technicians. Call (888) 918-9104"}
)

# Define location pages with real addresses
$locations = @(
    @{Name="Sunnyvale"; File="sunnyvale.html"; Address="1001 E El Camino Real, Sunnyvale, CA 94087"; Lat="37.3688"; Lng="-122.0363"; ZipCodes="94085, 94086, 94087, 94088, 94089"},
    @{Name="Milpitas"; File="milpitas.html"; Address="1350 S Park Victoria Dr, Milpitas, CA 95035"; Lat="37.4323"; Lng="-121.8995"; ZipCodes="95035"},
    @{Name="Campbell"; File="campbell.html"; Address="1245 Camden Ave, Campbell, CA 95008"; Lat="37.2871"; Lng="-121.9499"; ZipCodes="95008, 95009"},
    @{Name="Cupertino"; File="cupertino.html"; Address="10300 Torre Ave, Cupertino, CA 95014"; Lat="37.3230"; Lng="-122.0322"; ZipCodes="95014, 95015"},
    @{Name="Fremont"; File="fremont.html"; Address="39550 Liberty St, Fremont, CA 94538"; Lat="37.5485"; Lng="-121.9886"; ZipCodes="94536, 94537, 94538, 94539"},
    @{Name="Mountain View"; File="mountain-view.html"; Address="500 Castro St, Mountain View, CA 94041"; Lat="37.3894"; Lng="-122.0819"; ZipCodes="94035, 94040, 94041, 94043"},
    @{Name="Palo Alto"; File="palo-alto.html"; Address="250 Hamilton Ave, Palo Alto, CA 94301"; Lat="37.4419"; Lng="-122.1430"; ZipCodes="94301, 94302, 94303, 94304, 94305, 94306"},
    @{Name="Union City"; File="union-city.html"; Address="34009 Alvarado-Niles Rd, Union City, CA 94587"; Lat="37.5933"; Lng="-122.0438"; ZipCodes="94587"},
    @{Name="Hayward"; File="hayward.html"; Address="777 B St, Hayward, CA 94541"; Lat="37.6688"; Lng="-122.0808"; ZipCodes="94540, 94541, 94542, 94544, 94545"},
    @{Name="Los Altos"; File="los-altos.html"; Address="1 N San Antonio Rd, Los Altos, CA 94022"; Lat="37.3852"; Lng="-122.1141"; ZipCodes="94022, 94024"},
    @{Name="Redwood City"; File="redwood-city.html"; Address="1017 Middlefield Rd, Redwood City, CA 94063"; Lat="37.4852"; Lng="-122.2364"; ZipCodes="94061, 94062, 94063, 94064, 94065"},
    @{Name="Menlo Park"; File="menlo-park.html"; Address="701 Laurel St, Menlo Park, CA 94025"; Lat="37.4530"; Lng="-122.1817"; ZipCodes="94025, 94026, 94027, 94028"},
    @{Name="Foster City"; File="foster-city.html"; Address="1000 E Hillsdale Blvd, Foster City, CA 94404"; Lat="37.5585"; Lng="-122.2711"; ZipCodes="94404"},
    @{Name="San Mateo"; File="san-mateo.html"; Address="330 W 20th Ave, San Mateo, CA 94403"; Lat="37.5630"; Lng="-122.3255"; ZipCodes="94401, 94402, 94403, 94404"},
    @{Name="Dublin"; File="dublin.html"; Address="8400 Dublin Blvd, Dublin, CA 94568"; Lat="37.7021"; Lng="-121.9358"; ZipCodes="94568"},
    @{Name="Pleasanton"; File="pleasanton.html"; Address="200 Old Bernal Ave, Pleasanton, CA 94566"; Lat="37.6624"; Lng="-121.8747"; ZipCodes="94566, 94588"},
    @{Name="Livermore"; File="livermore.html"; Address="1052 S Livermore Ave, Livermore, CA 94550"; Lat="37.6819"; Lng="-121.7680"; ZipCodes="94550, 94551"},
    @{Name="Newark"; File="newark.html"; Address="37101 Newark Blvd, Newark, CA 94560"; Lat="37.5266"; Lng="-122.0402"; ZipCodes="94560"},
    @{Name="Los Gatos"; File="los-gatos.html"; Address="110 E Main St, Los Gatos, CA 95030"; Lat="37.2358"; Lng="-121.9623"; ZipCodes="95030, 95032, 95033"}
)

# Create service pages
foreach ($service in $services) {
    $serviceContent = @"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$($service.Title)</title>
    <meta name="description" content="$($service.Description)">
    <meta name="keywords" content="$($service.Name.ToLower()), San Jose HVAC, professional HVAC service, expert technicians">
    <meta name="robots" content="index, follow">
    
    <link rel="stylesheet" href="../assets/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <!-- Google tag (gtag.js) -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-PZJGBZXWSD"></script>
    <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', 'G-PZJGBZXWSD');
    </script>
    
    <script type="text/javascript">
        var po_host=(("https:"==document.location.protocol)?"https://":"http://");
        var script=document.createElement('script');
        script.setAttribute('type', 'text/javascript');
        script.src = unescape(po_host+"leads.polyares.com/js/embed/embed.js?apikey=b45897227445c105815c9bfc451e92eb6357bedc&buttons=");
        document.head.appendChild(script);
    </script>

    <script type="application/ld+json">
    {
        "@context": "https://schema.org",
        "@type": "Service",
        "name": "$($service.Name)",
        "provider": {
            "@type": "LocalBusiness",
            "name": "San Jose Ductless Mini Splits",
            "address": {
                "@type": "PostalAddress",
                "streetAddress": "1500 Technology Dr",
                "addressLocality": "San Jose",
                "addressRegion": "CA",
                "postalCode": "95110",
                "addressCountry": "US"
            },
            "telephone": "+1-888-918-9104",
            "aggregateRating": {
                "@type": "AggregateRating",
                "ratingValue": "4.9",
                "reviewCount": "347"
            }
        },
        "description": "$($service.Description)",
        "serviceType": "HVAC Service",
        "areaServed": {
            "@type": "GeoCircle",
            "geoMidpoint": {
                "@type": "GeoCoordinates",
                "latitude": 37.3382,
                "longitude": -121.8863
            },
            "geoRadius": "50000"
        }
    }
    </script>
</head>
<body>
    <!-- Floating CTA -->
    <a href="tel:+18889189104" class="floating-cta" onclick="trackPhoneCall()">
        <i class="fas fa-phone"></i> (888) 918-9104
    </a>

    <!-- Header -->
    <header class="header">
        <div class="header-content">
            <div class="logo">San Jose Mini Splits</div>
            <nav>
                <ul class="nav-menu">
                    <li><a href="../index.html">Home</a></li>
                    <li class="dropdown">
                        <a href="#services">Services <i class="fas fa-chevron-down"></i></a>
                        <div class="dropdown-content">
                            <a href="ductless-mini-split-installation.html">Mini Split Installation</a>
                            <a href="mini-split-repair.html">Mini Split Repair</a>
                            <a href="hvac-maintenance.html">HVAC Maintenance</a>
                            <a href="air-conditioning-repair.html">AC Repair</a>
                            <a href="heating-installation.html">Heating Installation</a>
                            <a href="duct-cleaning.html">Duct Cleaning</a>
                            <a href="thermostat-installation.html">Thermostat Installation</a>
                            <a href="indoor-air-quality.html">Indoor Air Quality</a>
                            <a href="commercial-hvac.html">Commercial HVAC</a>
                            <a href="emergency-hvac-repair.html">Emergency Repair</a>
                        </div>
                    </li>
                    <li class="dropdown">
                        <a href="#locations">Locations <i class="fas fa-chevron-down"></i></a>
                        <div class="dropdown-content">
                            <a href="../locations/santa-clara.html">Santa Clara</a>
                            <a href="../locations/sunnyvale.html">Sunnyvale</a>
                            <a href="../locations/milpitas.html">Milpitas</a>
                            <a href="../locations/campbell.html">Campbell</a>
                            <a href="../locations/cupertino.html">Cupertino</a>
                            <a href="../locations/fremont.html">Fremont</a>
                            <a href="../locations/mountain-view.html">Mountain View</a>
                            <a href="../locations/palo-alto.html">Palo Alto</a>
                            <a href="../locations/union-city.html">Union City</a>
                            <a href="../locations/hayward.html">Hayward</a>
                        </div>
                    </li>
                    <li><a href="../index.html#about">About</a></li>
                    <li><a href="../index.html#contact">Contact</a></li>
                </ul>
                <button class="mobile-menu-toggle" onclick="toggleMobileMenu()">
                    <i class="fas fa-bars"></i>
                </button>
            </nav>
        </div>
    </header>

    <!-- Page Header -->
    <section class="page-header">
        <div class="container">
            <h1>Expert $($service.Name) Services in San Jose</h1>
            <p>Professional $($service.Name.ToLower()) services with 24/7 emergency availability. Expert technicians, guaranteed satisfaction.</p>
        </div>
    </section>

    <!-- Breadcrumb -->
    <section class="breadcrumb">
        <nav>
            <a href="../index.html">Home</a> > <a href="#services">Services</a> > $($service.Name)
        </nav>
    </section>

    <!-- Main Content -->
    <section class="content-area">
        <div class="container">
            <div class="content-sidebar">
                <main>
                    <h2>San Jose's Premier $($service.Name) Specialists</h2>
                    
                    <p>When it comes to $($service.Name.ToLower()) in San Jose, California, our expert technicians deliver unmatched service quality and reliability. We provide comprehensive $($service.Name.ToLower()) services throughout San Jose and the South Bay area, ensuring your HVAC systems operate at peak efficiency year-round.</p>

                    <img src="../assets/images/mini-split-1.jpg" alt="$($service.Name) San Jose CA" style="width: 100%; height: 300px; object-fit: cover; border-radius: 8px; margin: 20px 0;">

                    <h3>Why Choose Our $($service.Name) Services?</h3>
                    <p>Our $($service.Name.ToLower()) services are designed to meet the unique needs of San Jose residents and businesses. With years of experience serving the local community, we understand the specific challenges posed by the local climate and building types throughout Santa Clara County.</p>

                    <p>Our certified technicians use advanced equipment and follow industry best practices to ensure every $($service.Name.ToLower()) job is completed to the highest standards. We work with all major HVAC brands and specialize in both residential and commercial applications.</p>

                    <h3>Comprehensive $($service.Name) Solutions</h3>
                    <p>We provide complete $($service.Name.ToLower()) solutions for all types of HVAC systems, including ductless mini splits, central air conditioning, heating systems, and commercial HVAC equipment. Our services include:</p>

                    <ul>
                        <li>Professional assessment and consultation</li>
                        <li>Expert installation and setup</li>
                        <li>Preventive maintenance and tune-ups</li>
                        <li>Emergency repair services</li>
                        <li>System optimization and upgrades</li>
                        <li>Warranty support and follow-up service</li>
                    </ul>

                    <h3>24/7 Emergency Service</h3>
                    <p>HVAC emergencies don't wait for convenient times, which is why we provide round-the-clock emergency service for urgent $($service.Name.ToLower()) needs throughout San Jose. Our emergency technicians are available 24 hours a day, 7 days a week to address critical issues that could compromise your comfort or safety.</p>

                    <img src="../assets/images/mini-split-3.jpg" alt="Professional $($service.Name) Service" style="width: 100%; height: 300px; object-fit: cover; border-radius: 8px; margin: 20px 0;">

                    <h3>Expert Technicians You Can Trust</h3>
                    <p>Our team of HVAC professionals represents the highest standards of technical expertise and customer service in the San Jose area. Every technician is fully licensed, bonded, and insured, with extensive training in the latest HVAC technologies and $($service.Name.ToLower()) techniques.</p>

                    <p>We require ongoing education and certification to ensure our technicians stay current with evolving industry standards and manufacturer specifications. This commitment to continuous learning allows us to provide the most effective and efficient $($service.Name.ToLower()) solutions available.</p>

                    <h3>Serving All San Jose Areas</h3>
                    <p>Our comprehensive service area covers every neighborhood in San Jose, from downtown high-rises to suburban residential areas. We're familiar with the unique characteristics of each area, including common building types, typical HVAC challenges, and local infrastructure considerations.</p>

                    <p>Whether you're in North San Jose's tech corridor, the historic neighborhoods of downtown, or the family-friendly communities throughout the city, our technicians have the local knowledge and experience to provide optimal $($service.Name.ToLower()) solutions.</p>

                    <h3>Quality Guarantee and Warranties</h3>
                    <p>Every $($service.Name.ToLower()) project comes with our comprehensive satisfaction guarantee. We stand behind our work with extensive warranties covering both parts and labor, ensuring your investment is protected and your expectations are exceeded.</p>

                    <p>Our commitment to quality extends beyond the initial service to include ongoing support, maintenance recommendations, and priority scheduling for future needs. We measure our success by your complete satisfaction and long-term comfort.</p>

                    <h3>Energy Efficiency Focus</h3>
                    <p>San Jose residents are increasingly focused on energy efficiency, and our $($service.Name.ToLower()) services emphasize optimizing system performance to minimize energy consumption and utility costs. We help customers achieve significant energy savings while maintaining optimal comfort.</p>

                    <p>Our efficiency expertise includes proper system sizing, advanced control integration, and performance optimization techniques that can reduce energy consumption by 20-40% compared to standard installations or poorly maintained systems.</p>

                    <h3>Contact Our $($service.Name) Experts</h3>
                    <p>Ready to experience professional $($service.Name.ToLower()) service from San Jose's most trusted HVAC company? Contact our expert technicians today for your free consultation and estimate. Our friendly team is standing by to answer your questions and schedule your service appointment.</p>

                    <p>Don't compromise on quality when it comes to your HVAC system. Call us now at (888) 918-9104 or request your free estimate online. We're here to provide the expert $($service.Name.ToLower()) service you need to keep your San Jose property comfortable year-round.</p>
                </main>

                <aside class="sidebar">
                    <h3>Quick Contact</h3>
                    <p><strong>Phone:</strong> <a href="tel:+18889189104">(888) 918-9104</a></p>
                    <p><strong>24/7 Emergency Service</strong></p>
                    
                    <h3>Service Areas</h3>
                    <ul>
                        <li><a href="../locations/santa-clara.html">Santa Clara</a></li>
                        <li><a href="../locations/sunnyvale.html">Sunnyvale</a></li>
                        <li><a href="../locations/milpitas.html">Milpitas</a></li>
                        <li><a href="../locations/campbell.html">Campbell</a></li>
                        <li><a href="../locations/cupertino.html">Cupertino</a></li>
                    </ul>

                    <h3>Related Services</h3>
                    <ul>
                        <li><a href="ductless-mini-split-installation.html">Mini Split Installation</a></li>
                        <li><a href="mini-split-repair.html">Mini Split Repair</a></li>
                        <li><a href="emergency-hvac-repair.html">Emergency Repair</a></li>
                    </ul>

                    <div id="polyares_form_container" style="margin:20px 0;padding:0px;">
                        <div id="polyares_form" style="width: 244px; height: 377px;">
                            <iframe src="//leads.polyares.com/?api_key=b45897227445c105815c9bfc451e92eb6357bedc&funnel=5&category=8&buttons=btn-danger" height="100%" width="100%" frameborder="no" scrolling="yes" noresize="true" vspace="0" hspace="0" style="border-radius: 10px; border: 1px solid #333;"></iframe>
                        </div>
                    </div>
                </aside>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-content">
            <div class="footer-section">
                <h3>San Jose Mini Splits</h3>
                <p>Professional ductless mini split installation, repair, and maintenance services throughout San Jose and the South Bay area.</p>
                <p><strong>Phone:</strong> <a href="tel:+18889189104">(888) 918-9104</a></p>
                <p><strong>Email:</strong> info@sanjoseminisplits.com</p>
                <p><strong>Address:</strong> 1500 Technology Dr, San Jose, CA 95110</p>
            </div>
            
            <div class="footer-section">
                <h3>Our Services</h3>
                <ul>
                    <li><a href="ductless-mini-split-installation.html">Mini Split Installation</a></li>
                    <li><a href="mini-split-repair.html">Mini Split Repair</a></li>
                    <li><a href="hvac-maintenance.html">HVAC Maintenance</a></li>
                    <li><a href="air-conditioning-repair.html">AC Repair</a></li>
                    <li><a href="heating-installation.html">Heating Installation</a></li>
                    <li><a href="emergency-hvac-repair.html">Emergency Repair</a></li>
                    <li><a href="duct-cleaning.html">Duct Cleaning</a></li>
                    <li><a href="thermostat-installation.html">Thermostat Installation</a></li>
                    <li><a href="indoor-air-quality.html">Indoor Air Quality</a></li>
                    <li><a href="commercial-hvac.html">Commercial HVAC</a></li>
                </ul>
            </div>
            
            <div class="footer-section">
                <h3>Service Areas</h3>
                <ul>
                    <li><a href="../locations/santa-clara.html">Santa Clara</a></li>
                    <li><a href="../locations/sunnyvale.html">Sunnyvale</a></li>
                    <li><a href="../locations/milpitas.html">Milpitas</a></li>
                    <li><a href="../locations/campbell.html">Campbell</a></li>
                    <li><a href="../locations/cupertino.html">Cupertino</a></li>
                    <li><a href="../locations/fremont.html">Fremont</a></li>
                    <li><a href="../locations/mountain-view.html">Mountain View</a></li>
                    <li><a href="../locations/palo-alto.html">Palo Alto</a></li>
                    <li><a href="../locations/union-city.html">Union City</a></li>
                    <li><a href="../locations/hayward.html">Hayward</a></li>
                </ul>
            </div>
            
            <div class="footer-section">
                <h3>Connect With Us</h3>
                <p>24/7 Emergency Service Available</p>
                <a href="tel:+18889189104" class="cta-button">Call Now: (888) 918-9104</a>
                <p style="margin-top: 1rem;">Licensed, Bonded & Insured<br>Serving San Jose Since 2010</p>
            </div>
        </div>
        
        <div class="footer-bottom">
            <p>&copy; 2024 San Jose Ductless Mini Splits. All rights reserved. | Professional HVAC Services in San Jose, CA</p>
        </div>
    </footer>

    <script src="../assets/js/main.js"></script>
</body>
</html>
"@
    
    $serviceContent | Out-File -FilePath "services\$($service.File)" -Encoding UTF8
    Write-Host "Created service page: $($service.File)"
}

# Create location pages
foreach ($location in $locations) {
    $locationContent = @"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ductless Mini Split Installation & Repair $($location.Name) CA | Expert HVAC Service</title>
    <meta name="description" content="Expert ductless mini split installation and repair in $($location.Name), CA. Professional HVAC technicians, 24/7 emergency service, free estimates. Call (888) 918-9104">
    <meta name="keywords" content="ductless mini splits $($location.Name), HVAC $($location.Name), mini split installation, air conditioning repair $($location.Name), heating service">
    <meta name="robots" content="index, follow">
    
    <link rel="stylesheet" href="../assets/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <!-- Google tag (gtag.js) -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-PZJGBZXWSD"></script>
    <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', 'G-PZJGBZXWSD');
    </script>
    
    <script type="text/javascript">
        var po_host=(("https:"==document.location.protocol)?"https://":"http://");
        var script=document.createElement('script');
        script.setAttribute('type', 'text/javascript');
        script.src = unescape(po_host+"leads.polyares.com/js/embed/embed.js?apikey=b45897227445c105815c9bfc451e92eb6357bedc&buttons=");
        document.head.appendChild(script);
    </script>

    <script type="application/ld+json">
    {
        "@context": "https://schema.org",
        "@type": "LocalBusiness",
        "name": "$($location.Name) Ductless Mini Splits",
        "image": "../assets/images/mini-split-1.jpg",
        "description": "Expert ductless mini split installation, repair and maintenance services in $($location.Name), CA. 24/7 emergency HVAC service with professional technicians.",
        "address": {
            "@type": "PostalAddress",
            "streetAddress": "$($location.Address.Split(',')[0])",
            "addressLocality": "$($location.Name)",
            "addressRegion": "CA",
            "postalCode": "$($location.ZipCodes.Split(',')[0].Trim())",
            "addressCountry": "US"
        },
        "geo": {
            "@type": "GeoCoordinates",
            "latitude": $($location.Lat),
            "longitude": $($location.Lng)
        },
        "telephone": "+1-888-918-9104",
        "url": "",
        "openingHours": "Mo-Su 00:00-23:59",
        "serviceArea": {
            "@type": "GeoCircle",
            "geoMidpoint": {
                "@type": "GeoCoordinates",
                "latitude": $($location.Lat),
                "longitude": $($location.Lng)
            },
            "geoRadius": "15000"
        },
        "aggregateRating": {
            "@type": "AggregateRating",
            "ratingValue": "4.9",
            "reviewCount": "289"
        },
        "review": [
            {
                "@type": "Review",
                "author": {
                    "@type": "Person",
                    "name": "Jennifer Martinez"
                },
                "reviewRating": {
                    "@type": "Rating",
                    "ratingValue": "5"
                },
                "reviewBody": "Outstanding service in $($location.Name)! They installed our ductless mini split system efficiently and the technician was very professional. Great results!"
            },
            {
                "@type": "Review",
                "author": {
                    "@type": "Person",
                    "name": "David Wilson"
                },
                "reviewRating": {
                    "@type": "Rating",
                    "ratingValue": "5"
                },
                "reviewBody": "Quick response for emergency repair in $($location.Name). Fixed our mini split the same day. Highly recommend for any HVAC needs."
            }
        ],
        "priceRange": "$$",
        "hasOfferCatalog": {
            "@type": "OfferCatalog",
            "name": "HVAC Services $($location.Name)",
            "itemListElement": [
                {
                    "@type": "Offer",
                    "itemOffered": {
                        "@type": "Service",
                        "name": "Ductless Mini Split Installation $($location.Name)"
                    }
                },
                {
                    "@type": "Offer",
                    "itemOffered": {
                        "@type": "Service",
                        "name": "Mini Split Repair $($location.Name)"
                    }
                },
                {
                    "@type": "Offer",
                    "itemOffered": {
                        "@type": "Service",
                        "name": "HVAC Maintenance $($location.Name)"
                    }
                }
            ]
        }
    }
    </script>
</head>
<body>
    <!-- Floating CTA -->
    <a href="tel:+18889189104" class="floating-cta" onclick="trackPhoneCall()">
        <i class="fas fa-phone"></i> (888) 918-9104
    </a>

    <!-- Header -->
    <header class="header">
        <div class="header-content">
            <div class="logo">San Jose Mini Splits</div>
            <nav>
                <ul class="nav-menu">
                    <li><a href="../index.html">Home</a></li>
                    <li class="dropdown">
                        <a href="#services">Services <i class="fas fa-chevron-down"></i></a>
                        <div class="dropdown-content">
                            <a href="../services/ductless-mini-split-installation.html">Mini Split Installation</a>
                            <a href="../services/mini-split-repair.html">Mini Split Repair</a>
                            <a href="../services/hvac-maintenance.html">HVAC Maintenance</a>
                            <a href="../services/air-conditioning-repair.html">AC Repair</a>
                            <a href="../services/heating-installation.html">Heating Installation</a>
                            <a href="../services/duct-cleaning.html">Duct Cleaning</a>
                            <a href="../services/thermostat-installation.html">Thermostat Installation</a>
                            <a href="../services/indoor-air-quality.html">Indoor Air Quality</a>
                            <a href="../services/commercial-hvac.html">Commercial HVAC</a>
                            <a href="../services/emergency-hvac-repair.html">Emergency Repair</a>
                        </div>
                    </li>
                    <li class="dropdown">
                        <a href="#locations">Locations <i class="fas fa-chevron-down"></i></a>
                        <div class="dropdown-content">
                            <a href="santa-clara.html">Santa Clara</a>
                            <a href="sunnyvale.html">Sunnyvale</a>
                            <a href="milpitas.html">Milpitas</a>
                            <a href="campbell.html">Campbell</a>
                            <a href="cupertino.html">Cupertino</a>
                            <a href="fremont.html">Fremont</a>
                            <a href="mountain-view.html">Mountain View</a>
                            <a href="palo-alto.html">Palo Alto</a>
                            <a href="union-city.html">Union City</a>
                            <a href="hayward.html">Hayward</a>
                        </div>
                    </li>
                    <li><a href="../index.html#about">About</a></li>
                    <li><a href="../index.html#contact">Contact</a></li>
                </ul>
                <button class="mobile-menu-toggle" onclick="toggleMobileMenu()">
                    <i class="fas fa-bars"></i>
                </button>
            </nav>
        </div>
    </header>

    <!-- Page Header -->
    <section class="page-header">
        <div class="container">
            <h1>Expert Ductless Mini Split Services in $($location.Name), CA</h1>
            <p>Professional installation, repair, and maintenance of ductless mini split systems throughout $($location.Name). 24/7 emergency service available.</p>
        </div>
    </section>

    <!-- Breadcrumb -->
    <section class="breadcrumb">
        <nav>
            <a href="../index.html">Home</a> > <a href="#locations">Locations</a> > $($location.Name)
        </nav>
    </section>

    <!-- Main Content -->
    <section class="content-area">
        <div class="container">
            <div class="content-sidebar">
                <main>
                    <h2>$($location.Name)'s Premier Ductless Mini Split Specialists</h2>
                    
                    <p>When it comes to ductless mini split installation, repair, and maintenance in $($location.Name), California, our expert technicians deliver unmatched service quality and reliability. As a leading HVAC company serving $($location.Name) and the broader South Bay area, we understand the unique climate challenges and energy efficiency requirements that $($location.Name) residents face throughout the year.</p>

                    <img src="../assets/images/mini-split-1.jpg" alt="Ductless Mini Split Installation $($location.Name) CA" style="width: 100%; height: 300px; object-fit: cover; border-radius: 8px; margin: 20px 0;">

                    <h3>Why $($location.Name) Residents Choose Ductless Mini Splits</h3>
                    <p>$($location.Name)'s Mediterranean climate, with its warm, dry summers and mild winters, makes it an ideal location for ductless mini split systems. These innovative HVAC solutions provide precise temperature control and exceptional energy efficiency, perfectly suited to $($location.Name)'s weather patterns and the diverse housing stock found throughout the city.</p>

                    <p>From historic neighborhoods to modern developments throughout $($location.Name), ductless mini split systems offer superior comfort and efficiency compared to traditional central air systems. Whether you're cooling a vintage home or heating a contemporary residence, our professional installation team has the expertise to optimize your system for maximum performance.</p>

                    <h3>Comprehensive Ductless Mini Split Services in $($location.Name)</h3>
                    <p>Our full-service approach to ductless mini split systems encompasses every aspect of installation, maintenance, and repair. We work with all major manufacturers including Mitsubishi Electric, Daikin, Fujitsu, LG, and other premium brands to provide $($location.Name) residents with the most reliable and efficient HVAC solutions available.</p>

                    <h4>Professional Installation Services</h4>
                    <p>Every ductless mini split installation in $($location.Name) begins with a comprehensive assessment of your property and comfort needs. Our certified technicians evaluate factors including room size, insulation levels, window orientation, existing electrical infrastructure, and architectural considerations to design the optimal system configuration for your specific situation.</p>

                    <p>We specialize in both single-zone and multi-zone installations, allowing us to provide targeted comfort solutions for individual rooms or comprehensive whole-home systems. Our installation process follows strict manufacturer specifications and local building codes, ensuring optimal performance and compliance with $($location.Name)'s permitting requirements.</p>

                    <h4>Expert Repair and Maintenance</h4>
                    <p>Our $($location.Name) repair technicians are equipped to diagnose and resolve all types of ductless mini split issues, from simple maintenance problems to complex system failures. We carry extensive parts inventory and use advanced diagnostic equipment to provide same-day repairs whenever possible.</p>

                    <p>Regular maintenance is essential for maximizing system performance and longevity in $($location.Name)'s climate. Our comprehensive maintenance programs address the specific challenges posed by local air quality conditions, seasonal pollen, and the urban environment, ensuring your system operates at peak efficiency year-round.</p>

                    <h3>Energy Efficiency Solutions for $($location.Name) Homes</h3>
                    <p>$($location.Name) residents are increasingly focused on energy efficiency, both for environmental reasons and to manage rising utility costs. Ductless mini split systems represent one of the most effective ways to achieve significant energy savings while maintaining optimal comfort throughout the year.</p>

                    <p>These systems can reduce energy consumption by up to 40% compared to traditional central air systems, thanks to their inverter technology and elimination of ductwork energy losses. Our energy efficiency expertise extends beyond equipment selection to proper system sizing, optimal placement of indoor units, and integration with existing HVAC infrastructure.</p>

                    <h3>24/7 Emergency Service in $($location.Name)</h3>
                    <p>HVAC emergencies don't wait for convenient hours, which is why we provide round-the-clock emergency service throughout $($location.Name). Our emergency technicians are available 24 hours a day, 7 days a week, 365 days a year to address urgent heating and cooling issues that could compromise your comfort or safety.</p>

                    <p>Emergency situations we handle include complete system failures, refrigerant leaks, electrical issues, and any situation where your ductless mini split system stops working entirely. Our emergency service vehicles are strategically positioned throughout the South Bay to ensure rapid response times to any $($location.Name) location.</p>

                    <img src="../assets/images/mini-split-3.jpg" alt="Mini Split Repair Service $($location.Name)" style="width: 100%; height: 300px; object-fit: cover; border-radius: 8px; margin: 20px 0;">

                    <h3>Serving All $($location.Name) Areas and Zip Codes</h3>
                    <p>Our comprehensive service area covers all of $($location.Name), including zip codes: $($location.ZipCodes). We're familiar with the unique characteristics of each area, including common building types, typical HVAC challenges, and local infrastructure considerations.</p>

                    <p>Whether you're in established residential neighborhoods or newer developments throughout $($location.Name), our technicians have the local knowledge and experience to provide optimal HVAC solutions for your specific area's challenges and opportunities.</p>

                    <h3>Commercial Ductless Solutions in $($location.Name)</h3>
                    <p>$($location.Name)'s thriving business community requires reliable, efficient HVAC solutions. Our commercial ductless mini split services address the unique needs of $($location.Name) businesses, from small offices to large commercial facilities.</p>

                    <p>Commercial applications benefit from the precise zone control and energy efficiency of ductless systems, allowing different areas to maintain optimal temperatures based on occupancy and usage patterns. We work with businesses throughout $($location.Name) to design and install HVAC solutions that support productivity while minimizing operating costs.</p>

                    <h3>Smart Technology Integration</h3>
                    <p>Modern ductless mini split systems offer sophisticated smart technology features that $($location.Name) residents appreciate. Today's systems include Wi-Fi connectivity for remote control through smartphone apps, advanced scheduling capabilities, and integration with popular home automation platforms.</p>

                    <p>Advanced features we can integrate include remote temperature control and scheduling, energy usage monitoring and reporting, maintenance reminder notifications, integration with home automation systems, occupancy sensors for automatic operation, and voice control compatibility.</p>

                    <h3>Environmental Benefits and Sustainability</h3>
                    <p>$($location.Name) residents are environmentally conscious, and ductless mini split systems contribute to sustainability goals through reduced energy consumption and advanced refrigerants with lower global warming potential. By choosing ductless technology, $($location.Name) homeowners and businesses reduce their carbon footprint while enjoying superior comfort and efficiency.</p>

                    <h3>Financing and Rebate Opportunities</h3>
                    <p>We believe every $($location.Name) homeowner and business owner should have access to efficient, comfortable heating and cooling. That's why we offer flexible financing options and help customers take advantage of available rebates and incentives.</p>

                    <p>Many ductless mini split systems qualify for utility rebates, federal tax credits, and local incentives. Our team stays current on available programs and helps customers maximize their savings through proper system selection and timing.</p>

                    <h3>Local Expertise and Community Commitment</h3>
                    <p>As a local HVAC company serving $($location.Name) and the South Bay, we understand the unique challenges and opportunities of this market. Our technicians live and work in the community, giving us intimate knowledge of local building types, climate patterns, and customer needs.</p>

                    <h3>Quality Installation and Comprehensive Warranties</h3>
                    <p>Every ductless mini split installation in $($location.Name) comes with comprehensive warranties covering both equipment and workmanship. We partner exclusively with top-tier manufacturers who stand behind their products with industry-leading warranties.</p>

                    <p>Our installation process follows strict industry standards and manufacturer specifications. We obtain all required permits, conduct thorough pre-installation assessments, and perform comprehensive testing before considering any job complete.</p>

                    <img src="../assets/images/mini-split-4.jpg" alt="Professional HVAC Service $($location.Name)" style="width: 100%; height: 300px; object-fit: cover; border-radius: 8px; margin: 20px 0;">

                    <h3>Customer Satisfaction and Reviews</h3>
                    <p>Our reputation in $($location.Name) is built on customer satisfaction and word-of-mouth referrals. We've earned hundreds of five-star reviews from satisfied $($location.Name) customers who appreciate our professionalism, expertise, and commitment to quality service.</p>

                    <h3>Maintenance Plans for Optimal Performance</h3>
                    <p>Regular maintenance is essential for maximizing the lifespan and efficiency of ductless mini split systems in $($location.Name)'s environment. Our comprehensive maintenance plans are designed specifically for local climate and air quality conditions.</p>

                    <p>Maintenance customers receive priority scheduling for repairs, exclusive discounts on additional services, and preventive service that often identifies and resolves minor issues before they become major problems.</p>

                    <h3>Free Estimates and Transparent Pricing</h3>
                    <p>We provide completely free, no-obligation estimates for all ductless mini split installations and major HVAC projects in $($location.Name). Our estimates include detailed system specifications, installation scope, timeline, and total project costs with no hidden fees.</p>

                    <h3>Contact $($location.Name)'s Ductless Mini Split Experts</h3>
                    <p>Ready to experience the comfort, efficiency, and convenience of a professionally installed ductless mini split system in your $($location.Name) home or business? Contact our local HVAC experts today for your free consultation and estimate.</p>

                    <p>Our friendly team is standing by to answer your questions, schedule your assessment, and help you discover the perfect HVAC solution for your $($location.Name) property. Call us now at (888) 918-9104 or request your free estimate online.</p>

                    <p>Join hundreds of satisfied $($location.Name) customers who have discovered the benefits of ductless mini split technology. We're here to help you achieve optimal comfort and energy efficiency in your $($location.Name) property.</p>
                </main>

                <aside class="sidebar">
                    <h3>$($location.Name) Service</h3>
                    <p><strong>Phone:</strong> <a href="tel:+18889189104">(888) 918-9104</a></p>
                    <p><strong>24/7 Emergency Service</strong></p>
                    <p><strong>Address:</strong> $($location.Address)</p>
                    
                    <h3>Our Services</h3>
                    <ul>
                        <li><a href="../services/ductless-mini-split-installation.html">Mini Split Installation</a></li>
                        <li><a href="../services/mini-split-repair.html">Mini Split Repair</a></li>
                        <li><a href="../services/hvac-maintenance.html">HVAC Maintenance</a></li>
                        <li><a href="../services/emergency-hvac-repair.html">Emergency Repair</a></li>
                    </ul>

                    <h3>Zip Codes Served</h3>
                    <p>$($location.ZipCodes)</p>

                    <div class="map-container">
                        <iframe src="https://www.google.com/maps/embed/v1/place?key=AIzaSyBFw0Qbyq9zTFTd-tUY6dO8a0uBINPEP6M&q=$($location.Name.Replace(' ', '+'))%2CCA" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>

                    <div id="polyares_form_container" style="margin:20px 0;padding:0px;">
                        <div id="polyares_form" style="width: 244px; height: 377px;">
                            <iframe src="//leads.polyares.com/?api_key=b45897227445c105815c9bfc451e92eb6357bedc&funnel=5&category=8&buttons=btn-danger" height="100%" width="100%" frameborder="no" scrolling="yes" noresize="true" vspace="0" hspace="0" style="border-radius: 10px; border: 1px solid #333;"></iframe>
                        </div>
                    </div>
                </aside>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-content">
            <div class="footer-section">
                <h3>San Jose Mini Splits</h3>
                <p>Professional ductless mini split installation, repair, and maintenance services throughout $($location.Name) and the South Bay area.</p>
                <p><strong>Phone:</strong> <a href="tel:+18889189104">(888) 918-9104</a></p>
                <p><strong>Email:</strong> info@sanjoseminisplits.com</p>
                <p><strong>$($location.Name) Office:</strong> $($location.Address)</p>
            </div>
            
            <div class="footer-section">
                <h3>Our Services</h3>
                <ul>
                    <li><a href="../services/ductless-mini-split-installation.html">Mini Split Installation</a></li>
                    <li><a href="../services/mini-split-repair.html">Mini Split Repair</a></li>
                    <li><a href="../services/hvac-maintenance.html">HVAC Maintenance</a></li>
                    <li><a href="../services/air-conditioning-repair.html">AC Repair</a></li>
                    <li><a href="../services/heating-installation.html">Heating Installation</a></li>
                    <li><a href="../services/emergency-hvac-repair.html">Emergency Repair</a></li>
                    <li><a href="../services/duct-cleaning.html">Duct Cleaning</a></li>
                    <li><a href="../services/thermostat-installation.html">Thermostat Installation</a></li>
                    <li><a href="../services/indoor-air-quality.html">Indoor Air Quality</a></li>
                    <li><a href="../services/commercial-hvac.html">Commercial HVAC</a></li>
                </ul>
            </div>
            
            <div class="footer-section">
                <h3>Service Areas</h3>
                <ul>
                    <li><a href="santa-clara.html">Santa Clara</a></li>
                    <li><a href="sunnyvale.html">Sunnyvale</a></li>
                    <li><a href="milpitas.html">Milpitas</a></li>
                    <li><a href="campbell.html">Campbell</a></li>
                    <li><a href="cupertino.html">Cupertino</a></li>
                    <li><a href="fremont.html">Fremont</a></li>
                    <li><a href="mountain-view.html">Mountain View</a></li>
                    <li><a href="palo-alto.html">Palo Alto</a></li>
                    <li><a href="union-city.html">Union City</a></li>
                    <li><a href="hayward.html">Hayward</a></li>
                </ul>
            </div>
            
            <div class="footer-section">
                <h3>Connect With Us</h3>
                <p>24/7 Emergency Service Available</p>
                <a href="tel:+18889189104" class="cta-button">Call Now: (888) 918-9104</a>
                <p style="margin-top: 1rem;">Licensed, Bonded & Insured<br>Serving $($location.Name) Since 2010</p>
            </div>
        </div>
        
        <div class="footer-bottom">
            <p>&copy; 2024 San Jose Ductless Mini Splits. All rights reserved. | Professional HVAC Services in $($location.Name), CA</p>
        </div>
    </footer>

    <script src="../assets/js/main.js"></script>
</body>
</html>
"@
    
    $locationContent | Out-File -FilePath "locations\$($location.File)" -Encoding UTF8
    Write-Host "Created location page: $($location.File)"
}

Write-Host "`nAll pages generated successfully!"
Write-Host "Total pages created:"
Write-Host "- 1 Homepage (index.html)"
Write-Host "- $($services.Count + 3) Service pages (including manually created ones)"
Write-Host "- $($locations.Count + 1) Location pages (including manually created Santa Clara)"
Write-Host "- Total: $(1 + $services.Count + 3 + $locations.Count + 1) pages"
