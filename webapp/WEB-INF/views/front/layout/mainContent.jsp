<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	<c:if test="${not empty write_ok_message}">
		alert('${write_ok_message}');
	</c:if>
// 	<c:if test="${not empty write_not_ok_message}">
// 		alert('${write_not_ok_message}');
// 	</c:if>
</script>

<div id="content" class="p-0" style="font-family: 'Noto Sans KR', sans-serif !important;">
  	<div class="bg-grey text-white py-4 py-lg-10 overlay overlay-dark overlay-op-6" id="page-title-video" 
  		data-bg-video="<c:url value='/resources/theme/assets/videos/cloud.mp4' />" >
		<div class="container d-lg-flex align-items-lg-end">
			<div>
				<h2 class="my-0 text-uppercase">WELCOME to HF-Campus</h2>
				<p class="op-8 mb-0">A Step for Your Future</p>
			</div>
			<!-- 
			<nav aria-label="breadcrumb" class="ml-lg-auto">
				<ol class="breadcrumb breadcrumb-dark p-0 mb-0 bg-transparent">
					<li class="breadcrumb-item">
						<a href="#" class="text-white op-6">Home</a>
					</li>
					<li class="breadcrumb-item">
						<a href="#" class="text-white op-6">Library</a>
					</li>
					<li class="breadcrumb-item active text-white op-9" aria-current="page">Data</li>
				</ol>
			</nav>
			 -->
		</div>
	</div>
  	
    <!-- Features -->
    <div id="features" class="container py-4 py-lg-6">
      <hr class="hr-lg mt-0 mb-3 w-10 mx-auto hr-primary" />
      <h2 class="text-center text-uppercase font-weight-bold my-0">
        Human & forest
      </h2>
      <h5 class="text-center font-weight-light mt-2 mb-0 text-muted">
        We Communicate with Data
      </h5>
      <hr class="mb-5 w-50 mx-auto" />
      <div class="row text-center">
        <div class="col-lg-4 py-1">
          <i class="la la-tachometer icon-3x text-primary" data-animate="fadeIn" data-animate-delay="0.1"></i>
          <h5 class="mt-1 op-8">
            Fully Optimized
          </h5>
          <p class="text-sm text-black-50">Blandit facilisis gemino iustum os persto quadrum ratis voco.</p>
        </div>
        <div class="col-lg-4 py-1">
          <i class="la la-wrench icon-3x text-primary" data-animate="fadeIn" data-animate-delay="0.2"></i>
          <h5 class="mt-1 op-8">
            Free Support
          </h5>
          <p class="text-sm text-black-50">Ex praesent sudo. Adipiscing aptent cui nutus torqueo.</p>
        </div>
        <div class="col-lg-4 py-1">
          <i class="la la-rocket icon-3x text-primary" data-animate="fadeIn" data-animate-delay="0.3"></i>
          <h5 class="mt-1 op-8">
            Free Upgrades
          </h5>
          <p class="text-sm text-black-50">Patria quidne tamen. Iaceo immitto importunus luptatum minim pneum tation valetudo vicis virtus.</p>
        </div>
        <div class="col-lg-4 py-1">
          <i class="la la-area-chart icon-3x text-primary" data-animate="fadeIn" data-animate-delay="0.4"></i>
          <h5 class="mt-1 op-8">
            99.9% Uptime
          </h5>
          <p class="text-sm text-black-50">Camur dolor iustum nibh nisl paulatim proprius tation turpis velit.</p>
        </div>
        <div class="col-lg-4 py-1">
          <i class="la la-users icon-3x text-primary" data-animate="fadeIn" data-animate-delay="0.5"></i>
          <h5 class="mt-1 op-8">
            Multiuser
          </h5>
          <p class="text-sm text-black-50">Commodo interdico nobis. Aliquam amet conventio esse nulla qui quidem similis utinam zelus.</p>
        </div>
        <div class="col-lg-4 py-1">
          <i class="la la-plug icon-3x text-primary" data-animate="fadeIn" data-animate-delay="0.6"></i>
          <h5 class="mt-1 op-8">
            Plug n play
          </h5>
          <p class="text-sm text-black-50">Abigo accumsan damnum dolus genitus macto oppeto quae velit.</p>
        </div>
      </div>
    </div>
    <!-- Why AppStrap -->
    <div class="bg-dark">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-5 divider-diagonal divider-diagonal-r divider-dark" data-bg-img="<c:url value='/resources/theme/assets/img/backgrounds/computer-screens.jpg' />"></div>
          <div class="col-lg-4 py-5">
            <hr class="hr-lg mt-0 mb-2 w-10 ml-0 hr-primary" />
            <h2 class="text-white text-uppercase mt-0 mb-5">
              Choose <span class="text-primary font-weight-bold">AppStrap</span>
            </h2>
            <div class="d-flex mb-3">
              <i class="la la-check text-white icon-1x icon-sq rounded-circle bg-primary mr-3"></i>

              <div class="flex-fill text-grey">
                <h4 class="font-weight-bold text-white mb-0 op-9">
                  Fully Optimized
                </h4>
                <p class="op-8 text-sm">Camur ea euismod minim obruo pertineo refero. Consequat luptatum veniam. Accumsan ad aliquam laoreet luctus luptatum persto refoveo.</p>
              </div>
            </div>
            <div class="d-flex mb-3">
              <i class="la la-check text-white icon-1x icon-sq rounded-circle bg-primary mr-3"></i>

              <div class="flex-fill text-grey">
                <h4 class="font-weight-bold text-white mb-0 op-9">
                  Free Upgrades
                </h4>
                <p class="op-8 text-sm">Aliquip causa letalis luptatum mauris metuo meus neo nulla utrum. Adipiscing aliquam causa exerci facilisis ideo iusto jumentum torqueo venio.</p>
              </div>
            </div>
            <div class="d-flex mb-3">
              <i class="la la-check text-white icon-1x icon-sq rounded-circle bg-primary mr-3"></i>

              <div class="flex-fill text-grey">
                <h4 class="font-weight-bold text-white mb-0 op-9">
                  99.9% Uptime
                </h4>
                <p class="op-8 text-sm">Dolus olim scisco. Bene caecus iaceo scisco typicus ulciscor ymo. Abigo magna nutus quia secundum similis sit te veniam zelus.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--Pricing Table-->
    <div id="pricing" class="bg-light py-3 py-lg-6">
      <div class="container">
        <hr class="hr-lg mt-0 mb-3 w-10 mx-auto hr-primary" />
        <h2 class="text-center text-uppercase font-weight-bold my-0">
          Pricing Plans
        </h2>
        <h5 class="text-center font-weight-light mt-2 mb-0 text-muted">
          Competitive pricing plans to suit your needs
        </h5>
        <hr class="mb-5 w-50 mx-auto" />
        <div class="row pricing-stack">
          <div class="col-md-3">
            <div class="card bg-shadow text-center border-0">
              <h4 class="card-title py-3 my-0 text-shadow op-8">
                Starter
              </h4>
              <p class="price-banner bg-light shadow-sm card-body-overlap"> <span class="price-digits">Free!</span>
              </p>
              <div class="card-body">
                <ul class="list-unstyled text-sm text-black-50">
                  <li>3 User Accounts</li>
                  <li>3 Private Projects</li>
                  <li>Umlimited Public Projects</li>
                  <li>5GB of space</li>
                </ul>
                <a href="#" class="btn btn-primary btn-rounded btn-lg">Sign Up</a>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="card bg-white bg-shadow text-center rounded-0 border-0 border-top-3-primary">
              <h4 class="card-title py-3 my-0 text-shadow op-8">
                Professional
              </h4>
              <p class="price-banner bg-light shadow-sm card-body-overlap">
                <span class="price-currency">$</span>
                <span class="price-digits">49<span>.95</span></span>
                <span class="price-extra">/MO</span>

              </p>
              <div class="card-body">
                <ul class="list-unstyled text-sm text-black-50">
                  <li>50 User Accounts</li>
                  <li>50 Private Projects</li>
                  <li>Umlimited Public Projects</li>
                  <li>Unlimited space</li>
                </ul>
                <a href="#" class="btn btn-primary btn-rounded btn-lg mt-4">Sign Up</a>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="card bg-white bg-shadow text-center rounded-0 border-0 border-top-3-primary">
              <div class="card-ribbon card-ribbon-top card-ribbon-left bg-primary text-white">Popular</div>
              <h4 class="card-title py-3 my-0 text-shadow op-8">
                Business
              </h4>
              <p class="price-banner bg-light shadow-sm card-body-overlap">
                <span class="price-currency">$</span>
                <span class="price-digits">199<span>.95</span></span>
                <span class="price-term">/MO</span>

              </p>
              <div class="card-body">
                <ul class="list-unstyled text-sm text-black-50">
                  <li>Umlimited User Accounts</li>
                  <li>Umlimited Private Projects</li>
                  <li>Umlimited Public Projects</li>
                  <li>Unlimited space</li>
                </ul>
                <a href="#" class="btn btn-primary btn-rounded btn-lg mt-4">Sign Up</a>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="card bg-shadow text-center border-0">
              <div class="card-ribbon card-ribbon-top card-ribbon-right bg-light text-muted">Best Buy</div>
              <h4 class="card-title py-3 my-0 text-shadow op-8">
                Starter+
              </h4>
              <p class="price-banner bg-light shadow-sm card-body-overlap">
                <span class="price-currency">$</span>
                <span class="price-digits">19<span>.95</span></span>
                <span class="price-term">/MO</span>

              </p>
              <div class="card-body">
                <ul class="list-unstyled text-sm text-black-50">
                  <li>10 User Accounts</li>
                  <li>10 Private Projects</li>
                  <li>Umlimited Public Projects</li>
                  <li>15GB of space</li>
                </ul>
                <a href="#" class="btn btn-primary btn-rounded btn-lg">Sign Up</a>
              </div>
            </div>
          </div>
        </div>
        <!-- Plan features -->
        <div class="bg-white bg-op-4 bg-shadow py-3 mt-4 text-center">
          <h5 class="d-inline-block pr-1 my-0">
            All Plans Include:
          </h5>
          <p class="d-inline-block text-black-50 my-0">90 day money back guarantee <span class="text-primary font-weight-bold mx-2">//</span> 24/7 telephone support <span class="text-primary font-weight-bold mx-2">//</span> FREE Setup <span class="text-primary font-weight-bold mx-2">//</span> Migration Help <span class="text-primary font-weight-bold mx-2">//</span> Developer API</p>
        </div>
      </div>
    </div>
    <!-- Steps -->
    <div class="container">
      <div class="py-3 py-lg-6">
        <ul class="nav nav-steps nav-steps-circles flex-column flex-lg-row justify-content-around w-80 mx-auto">
          <li class="nav-item">
            <a href="#tab-steps1" class="nav-link active" data-toggle="tab"> <i class="fa fa-camera-retro icon-2x mb-05"></i> <span class="font-weight-bold d-block">Step 1</span> </a>
          </li>
          <li class="nav-item">
            <a href="#tab-steps2" class="nav-link" data-toggle="tab"> <i class="fa fa-thumbs-up icon-2x mb-05"></i> <span class="font-weight-bold d-block">Step 2</span> </a>
          </li>
          <li class="nav-item">
            <a href="#tab-steps3" class="nav-link" data-toggle="tab"> <i class="fa fa-rocket icon-2x mb-05"></i> <span class="font-weight-bold d-block">Step 3</span> </a>
          </li>
          <li class="nav-item">
            <a href="#tab-steps4" class="nav-link" data-toggle="tab"> <i class="fa fa-flag icon-2x mb-05"></i> <span class="font-weight-bold d-block">Step 4</span> </a>
          </li>
        </ul>
        <div class="tab-content text-center pb-2 px-md-6">
          <div class="tab-pane fade active show w-lg-70 mx-lg-auto" id="tab-steps1">
            <i class="fa fa-camera-retro icon-3x icon-sq bg-light rounded-circle border-grey mb-2"></i>

            <h3 class="op-8">
              Quick Start Step 1
            </h3>
            <p class="text-black-50">Dignissim tincidunt mattis lorem, sagittis nisi, amet ut pulvinar lectus cursus ac! Enim turpis odio dis. Non ut vel, nisi dapibus? Velit augue tortor, ut ac ac nec tortor nec, mauris massa.</p>
            <a href="https://wrapbootstrap.com/theme/appstrap-responsive-website-template-WB0C6D0H4?ref=tme" class="btn btn-lg btn-light border-bottom">Get Started now</a>
          </div>
          <div class="tab-pane fade w-lg-70 mx-lg-auto" id="tab-steps2">
            <i class="fa fa-thumbs-up icon-3x icon-sq bg-light rounded-circle border-grey mb-2"></i>

            <h3 class="op-8">
              Quick Start Step 2
            </h3>
            <p class="text-black-50">Aliquet risus, penatibus, ac integer ultricies ultricies elementum augue proin habitasse placerat. Nunc habitasse duis, elementum, porttitor porta? Purus, ac odio. Habitasse, egestas vut.</p>
            <a href="https://wrapbootstrap.com/theme/appstrap-responsive-website-template-WB0C6D0H4?ref=tme" class="btn btn-lg btn-light border-bottom">Get Started now</a>
          </div>
          <div class="tab-pane fade w-lg-70 mx-lg-auto" id="tab-steps3">
            <i class="fa fa-rocket icon-3x icon-sq bg-light rounded-circle border-grey mb-2"></i>

            <h3 class="op-8">
              Quick Start Step 3
            </h3>
            <p class="text-black-50">Turpis elit, egestas nec etiam! Porta parturient amet! Eros aenean sit lacus sagittis massa? Massa a nunc! Nisi vut! Lundium, dictumst, nunc enim, natoque, cras nec, dictumst et rhoncus!</p>
            <a href="https://wrapbootstrap.com/theme/appstrap-responsive-website-template-WB0C6D0H4?ref=tme" class="btn btn-lg btn-light border-bottom">Get Started now</a>
          </div>
          <div class="tab-pane fade w-lg-70 mx-lg-auto" id="tab-steps4">
            <i class="fa fa-flag icon-3x icon-sq bg-light rounded-circle border-grey mb-2"></i>

            <h3 class="op-8">
              Quick Start Step 4
            </h3>
            <p class="text-black-50">Dignissim enim in vel urna tortor nascetur rhoncus parturient ultricies, purus lundium velit nec arcu et dolor vel. </p>
            <a href="https://wrapbootstrap.com/theme/appstrap-responsive-website-template-WB0C6D0H4?ref=tme" class="btn btn-lg btn-light border-bottom">Get Started now</a>
          </div>
        </div>
      </div>
    </div>
    <!-- Video background MDR -->
    <div class="p-3 p-lg-5 bg-light text-center overlay overlay-dark overlay-op-5" data-bg-video="<c:url value='/resources/theme/assets/videos/bubbles.mp4' />" data-animate="fadeIn">
      <div class="container">
        <h2 class="text-white display-4 text-shadow">
          Add some <span class="font-italic font-weight-bold">fizz</span> to your next website!
        </h2>
        <a href="https://wrapbootstrap.com/theme/appstrap-responsive-website-template-WB0C6D0H4?ref=tme" class="btn btn-xlg btn-rounded btn-primary mt-4">Get AppStrap!</a>

      </div>
    </div>
    <!--Projects carousel -->
    <div id="projects" class="container p-3 py-lg-6" data-toggle="magnific-popup" data-magnific-popup-settings='{"delegate": "a.project", "gallery":{"enabled":true}}'>
      <hr class="hr-lg mt-0 mb-3 w-10 mx-auto hr-primary" />
      <h2 class="text-center text-uppercase font-weight-bold my-0">
        Latest Projects
      </h2>
      <h5 class="text-center font-weight-light mt-2 mb-0 text-muted">
        See what we've been working on!
      </h5>
      <hr class="mb-5 w-50 mx-auto" />
      <div class="mt-4 owl-nav-over owl-nav-over-lg owl-dots-center" data-toggle="owl-carousel" data-owl-carousel-settings='{"responsive":{"0":{"items":1, "nav":false, "dots":true}, "600":{"items":2, "dots":true}, "940":{"items":3, "nav":true, "dots":true}}, "margin":1, "nav":true, "dots":false}'>

        <!--Project item 1-->
        <a href="<c:url value='/resources/theme/assets/img/projects/project-1.jpg' />" class="project overlay-hover">
          <img src="<c:url value='/resources/theme/assets/img/projects/project-1-sm.jpg' />" alt="Project 1" class="img-fluid" />
          <span class="overlay-hover-content"> <i class="fa fa-arrow-circle-right icon-3x text-white"></i> <span class="h5 mt-4">Euismod Nutus Pala Validus Vulpes</span> </span>
        </a>

        <!--Project item 2-->
        <a href="<c:url value='/resources/theme/assets/img/projects/project-2.jpg' />" class="project overlay-hover">
          <img src="<c:url value='/resources/theme/assets/img/projects/project-2-sm.jpg' />" alt="Project 2" class="img-fluid" />
          <span class="overlay-hover-content"> <i class="fa fa-arrow-circle-right icon-3x text-white"></i> <span class="h5 mt-4">Causa Dolore Esca Melior Sino</span> </span>
        </a>

        <!--Project item 3-->
        <a href="<c:url value='/resources/theme/assets/img/projects/project-3.jpg' />" class="project overlay-hover">
          <img src="<c:url value='/resources/theme/assets/img/projects/project-3-sm.jpg' />" alt="Project 3" class="img-fluid" />
          <span class="overlay-hover-content"> <i class="fa fa-arrow-circle-right icon-3x text-white"></i> <span class="h5 mt-4">Gemino Interdico Proprius Quibus Vulpes</span> </span>
        </a>

        <!--Project item 4-->
        <a href="<c:url value='/resources/theme/assets/img/projects/project-4.jpg' />" class="project overlay-hover">
          <img src="<c:url value='/resources/theme/assets/img/projects/project-4-sm.jpg' />" alt="Project 4" class="img-fluid" />
          <span class="overlay-hover-content"> <i class="fa fa-arrow-circle-right icon-3x text-white"></i> <span class="h5 mt-4">Eligo Esca Loquor Lucidus Rusticus</span> </span>
        </a>

        <!--Project item 5-->
        <a href="<c:url value='/resources/theme/assets/img/projects/project-5.jpg' />" class="project overlay-hover">
          <img src="<c:url value='/resources/theme/assets/img/projects/project-5-sm.jpg' />" alt="Project 5" class="img-fluid" />
          <span class="overlay-hover-content"> <i class="fa fa-arrow-circle-right icon-3x text-white"></i> <span class="h5 mt-4">Ex Hos Immitto Ullamcorper Venio</span> </span>
        </a>

        <!--Project item 6-->
        <a href="<c:url value='/resources/theme/assets/img/projects/project-6.jpg' />" class="project overlay-hover">
          <img src="<c:url value='/resources/theme/assets/img/projects/project-6-sm.jpg' />" alt="Project 6" class="img-fluid" />
          <span class="overlay-hover-content"> <i class="fa fa-arrow-circle-right icon-3x text-white"></i> <span class="h5 mt-4">Ad Lucidus Nimis Quidem Sagaciter</span> </span>
        </a>

        <!--Project item 7-->
        <a href="<c:url value='/resources/theme/assets/img/projects/project-7.jpg' />" class="project overlay-hover">
          <img src="<c:url value='/resources/theme/assets/img/projects/project-7-sm.jpg' />" alt="Project 7" class="img-fluid" />
          <span class="overlay-hover-content"> <i class="fa fa-arrow-circle-right icon-3x text-white"></i> <span class="h5 mt-4">Iriure Letalis Luptatum Qui Sit</span> </span>
        </a>

        <!--Project item 8-->
        <a href="<c:url value='/resources/theme/assets/img/projects/project-8.jpg' />" class="project overlay-hover">
          <img src="<c:url value='/resources/theme/assets/img/projects/project-8-sm.jpg' />" alt="Project 8" class="img-fluid" />
          <span class="overlay-hover-content"> <i class="fa fa-arrow-circle-right icon-3x text-white"></i> <span class="h5 mt-4">Damnum Euismod Immitto Meus Pneum</span> </span>
        </a>

        <!--Project item 9-->
        <a href="<c:url value='/resources/theme/assets/img/projects/project-9.jpg' />" class="project overlay-hover">
          <img src="<c:url value='/resources/theme/assets/img/projects/project-9-sm.jpg' />" alt="Project 9" class="img-fluid" />
          <span class="overlay-hover-content"> <i class="fa fa-arrow-circle-right icon-3x text-white"></i> <span class="h5 mt-4">Augue Luctus Roto Sagaciter Similis</span> </span>
        </a>

        <!--Project item 10-->
        <a href="<c:url value='/resources/theme/assets/img/projects/project-10.jpg' />" class="project overlay-hover">
          <img src="<c:url value='/resources/theme/assets/img/projects/project-10-sm.jpg' />" alt="Project 10" class="img-fluid" />
          <span class="overlay-hover-content"> <i class="fa fa-arrow-circle-right icon-3x text-white"></i> <span class="h5 mt-4">Ille Loquor Luctus Paratus Tego</span> </span>
        </a>
      </div>
    </div>
    <!--Customer testimonial-->
    <div id="testimonials" class="p-3 py-lg-6 bg-dark">
      <div class="container">
        <hr class="hr-lg mt-0 mb-3 w-10 mx-auto hr-primary" />
        <h2 class="text-white text-center text-uppercase font-weight-bold my-0">
          Highly Recommended
        </h2>
        <h5 class="text-center font-weight-light mt-2 mb-0 text-grey">
          99% of our customers recommend us!
        </h5>
        <hr class="mb-5 w-50 mx-auto" />
        <div class="row">
          <div class="col-md-4 d-md-flex">
            <blockquote class="blockquote-bubble text-center" data-animate="fadeIn" data-animate-delay="0.1">
              <p class="blockquote-bubble-content bg-white">"It's totally awesome, we're could imagine life without it!"</p>
              <small class="text-grey">
                <img src="<c:url value='/resources/theme/assets/img/team/jimi.jpg' />" alt="Jimi Bloggs" class="rounded-circle mr-2" />
                Jimi Bloggs <span class="text-primary font-weight-bold">/</span> <a href="#">@mrjimi</a>
              </small>
            </blockquote>
          </div>
          <div class="col-md-4 d-md-flex">
            <blockquote class="blockquote-bubble text-center" data-animate="fadeIn" data-animate-delay="0.2">
              <p class="blockquote-bubble-content bg-white text-center">"10 out of 10, highly recommended!"</p>
              <small class="text-grey">
                <img src="<c:url value='/resources/theme/assets/img/team/steve.jpg' />" alt="Jimi Bloggs" class="rounded-circle mr-2" />
                Steve Bloggs <span class="text-primary font-weight-bold">/</span> <a href="#">Founder of Apple</a>
              </small>
            </blockquote>
          </div>
          <div class="col-md-4 d-md-flex">
            <blockquote class="blockquote-bubble text-center" data-animate="fadeIn" data-animate-delay="0.3">
              <p class="blockquote-bubble-content bg-white text-center">"Our productivity & sales are up! Couldn't be happier with this product!"</p>
              <small class="text-grey">
                <img src="<c:url value='/resources/theme/assets/img/team/adele.jpg' />" alt="Adele Bloggs" class="rounded-circle mr-2" />
                Adele Bloggs <span class="text-primary font-weight-bold">/</span> <a href="#">@iamadele</a>
              </small>
            </blockquote>
          </div>
        </div>
      </div>
    </div>
  </div>
