<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html lang="nl">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Innovation Circle Nieuwsbrief | April 2026</title>
    <style>
        :root {
            --surface: #f9f9f9;
            --surface-gray: #f0f0f0;
            --paper-white: #ffffff;
            --surface-container: #eeeeee;
            --surface-container-high: #e8e8e8;
            --on-surface: #1a1c1c;
            --on-surface-variant: #3f4949;
            --outline: #6f797a;
            --outline-soft: #d1d1d1;
            --outline-variant: #bec8c9;
            --deep-teal: #00666b;
            --primary: #004c50;
            --primary-dark: #002f32;
            --primary-soft: #e7f4f5;
            --prestige-gold: #f6db3e;
            --gold-soft: #fff8cd;
            --tertiary: #6a3612;
            --max-width: 1200px;
            --gutter: 24px;
        }

        * {
            box-sizing: border-box;
        }

        figure {
            margin: 0;
        }

        html {
            background: var(--surface);
            color: var(--on-surface);
            font-family: "Open Sans", Arial, sans-serif;
            scroll-behavior: smooth;
        }

        body {
            margin: 0;
            background: var(--surface);
            color: var(--on-surface);
            font-size: 16px;
            line-height: 1.5;
        }

        a {
            color: var(--primary);
            text-decoration-color: rgba(0, 76, 80, 0.35);
            text-underline-offset: 3px;
        }

        a:hover {
            color: var(--deep-teal);
            text-decoration-color: var(--prestige-gold);
        }

        .page-shell {
            min-height: 100vh;
        }

        .container {
            width: min(100% - 48px, var(--max-width));
            margin: 0 auto;
        }

        .eyebrow {
            margin: 0 0 12px;
            color: var(--primary);
            font-family: "Montserrat", Arial, sans-serif;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 0.1em;
            line-height: 16px;
            text-transform: uppercase;
        }

        .site-header {
            background: var(--paper-white);
            border-bottom: 1px solid var(--outline-soft);
        }

        .nav {
            align-items: center;
            display: flex;
            justify-content: space-between;
            min-height: 80px;
            gap: 24px;
        }

        .brand {
            color: var(--primary);
            font-family: "Montserrat", Arial, sans-serif;
            font-size: 18px;
            font-weight: 700;
            line-height: 24px;
            text-decoration: none;
        }

        .nav-links {
            align-items: center;
            display: flex;
            flex-wrap: wrap;
            gap: 24px;
            justify-content: flex-end;
        }

        .nav-links a {
            border-bottom: 2px solid transparent;
            color: var(--on-surface-variant);
            font-family: "Montserrat", Arial, sans-serif;
            font-size: 13px;
            font-weight: 600;
            line-height: 18px;
            padding: 28px 0 24px;
            text-decoration: none;
        }

        .nav-links a:hover,
        .nav-links a.is-active {
            border-bottom-color: var(--prestige-gold);
            color: var(--primary);
        }

        .hero {
            background:
                linear-gradient(90deg, rgba(0, 76, 80, 0.98), rgba(0, 102, 107, 0.9)),
                linear-gradient(135deg, rgba(255, 255, 255, 0.08) 0 25%, transparent 25% 50%, rgba(255, 255, 255, 0.06) 50% 75%, transparent 75%);
            background-position: center;
            background-size: cover, 48px 48px;
            color: #ffffff;
            min-height: 520px;
            padding: 96px 0 80px;
            position: relative;
        }

        .hero::after {
            background: var(--prestige-gold);
            bottom: 0;
            content: "";
            height: 6px;
            left: 0;
            position: absolute;
            width: 100%;
        }

        .hero-grid {
            display: grid;
            gap: 48px;
            grid-template-columns: minmax(0, 7fr) minmax(280px, 3fr);
            align-items: end;
        }

        .hero .eyebrow {
            color: var(--prestige-gold);
        }

        h1,
        h2,
        h3,
        h4 {
            color: inherit;
            font-family: "Montserrat", Arial, sans-serif;
            letter-spacing: 0;
            margin: 0;
        }

        h1 {
            font-size: clamp(38px, 5vw, 56px);
            font-weight: 700;
            line-height: 1.08;
            max-width: 880px;
        }

        .hero-copy {
            color: rgba(255, 255, 255, 0.88);
            font-size: 18px;
            line-height: 28px;
            margin: 24px 0 0;
            max-width: 720px;
        }

        .issue-panel {
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.26);
            border-radius: 8px;
            padding: 24px;
        }

        .issue-panel dl {
            display: grid;
            gap: 18px;
            margin: 0;
        }

        .issue-panel dt {
            color: rgba(255, 255, 255, 0.72);
            font-family: "Montserrat", Arial, sans-serif;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 0.1em;
            line-height: 16px;
            text-transform: uppercase;
        }

        .issue-panel dd {
            color: #ffffff;
            font-family: "Montserrat", Arial, sans-serif;
            font-size: 20px;
            font-weight: 600;
            line-height: 28px;
            margin: 4px 0 0;
        }

        main {
            background: var(--surface);
        }

        section {
            padding: 80px 0;
        }

        .section-intro {
            display: grid;
            gap: 24px;
            grid-template-columns: minmax(0, 5fr) minmax(260px, 3fr);
            margin-bottom: 40px;
        }

        .section-intro h2 {
            color: var(--on-surface);
            font-size: 32px;
            font-weight: 700;
            line-height: 40px;
        }

        .section-intro p {
            color: var(--on-surface-variant);
            font-size: 17px;
            line-height: 27px;
            margin: 0;
        }

        .initiative-grid {
            display: grid;
            gap: 24px;
            grid-template-columns: repeat(4, minmax(0, 1fr));
        }

        .initiative-card,
        .story-card,
        .tool-panel {
            background: var(--paper-white);
            border: 1px solid var(--outline-soft);
            border-radius: 8px;
        }

        .initiative-card {
            display: flex;
            flex-direction: column;
            min-height: 100%;
            overflow: hidden;
        }

        .card-body {
            display: flex;
            flex: 1;
            flex-direction: column;
            padding: 28px;
        }

        .card-media,
        .story-media,
        .tool-media {
            background: var(--surface-container-high);
            display: block;
            overflow: hidden;
            position: relative;
        }

        .card-media {
            aspect-ratio: 16 / 10;
        }

        .card-media img,
        .story-media img,
        .tool-media img {
            display: block;
            height: 100%;
            object-fit: cover;
            width: 100%;
        }

        .visual-svg {
            display: block;
            height: 100%;
            width: 100%;
        }

        .visual-bg {
            fill: #e7f4f5;
        }

        .visual-panel {
            fill: #ffffff;
            stroke: #bec8c9;
            stroke-width: 2;
        }

        .visual-primary {
            fill: #00666b;
        }

        .visual-primary-dark {
            fill: #004c50;
        }

        .visual-gold {
            fill: #f6db3e;
        }

        .visual-muted {
            fill: #bec8c9;
        }

        .story-media {
            border-radius: 6px;
            min-height: 168px;
        }

        .card-index {
            align-items: center;
            background: var(--primary-soft);
            border: 1px solid rgba(0, 102, 107, 0.18);
            border-radius: 999px;
            color: var(--primary);
            display: inline-flex;
            font-family: "Montserrat", Arial, sans-serif;
            font-size: 12px;
            font-weight: 700;
            height: 32px;
            justify-content: center;
            margin-bottom: 22px;
            width: 32px;
        }

        .initiative-card h3,
        .story-card h3,
        .tool-panel h3 {
            color: var(--primary);
            font-size: 20px;
            font-weight: 600;
            line-height: 28px;
        }

        .initiative-card p,
        .story-card p,
        .tool-panel p,
        .tool-panel li {
            color: var(--on-surface-variant);
            font-size: 15px;
            line-height: 24px;
        }

        .initiative-card p,
        .story-card p,
        .tool-panel p {
            margin: 16px 0 0;
        }

        .callout-band {
            background: var(--surface-gray);
            border-block: 1px solid var(--outline-soft);
        }

        .headline-layout {
            display: grid;
            gap: 24px;
            grid-template-columns: minmax(0, 2fr) minmax(300px, 1fr);
        }

        .story-list {
            display: grid;
            gap: 16px;
        }

        .story-card {
            display: grid;
            gap: 24px;
            grid-template-columns: 220px minmax(0, 1fr);
            padding: 24px;
        }

        .story-meta {
            color: var(--tertiary);
            display: block;
            font-family: "Montserrat", Arial, sans-serif;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 0.1em;
            line-height: 16px;
            margin-bottom: 12px;
            text-transform: uppercase;
        }

        .watch-list {
            border-top: 1px solid var(--outline-soft);
            display: grid;
            gap: 10px;
            margin: 18px 0 0;
            padding: 18px 0 0;
        }

        .watch-list p {
            margin: 0;
        }

        .watch-list strong {
            color: var(--on-surface);
            font-family: "Montserrat", Arial, sans-serif;
            font-size: 13px;
            font-weight: 700;
        }

        .tool-panel {
            align-self: start;
            overflow: hidden;
            padding: 0;
            position: sticky;
            top: 24px;
        }

        .tool-content {
            padding: 28px;
        }

        .tool-media {
            aspect-ratio: 16 / 9;
            border-bottom: 1px solid var(--outline-soft);
        }

        .tool-panel ul {
            display: grid;
            gap: 10px;
            margin: 16px 0 0;
            padding-left: 20px;
        }

        .tool-badge {
            background: var(--gold-soft);
            border: 1px solid rgba(246, 219, 62, 0.9);
            border-radius: 999px;
            color: #524700;
            display: inline-flex;
            font-family: "Montserrat", Arial, sans-serif;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 0.1em;
            line-height: 16px;
            margin-bottom: 18px;
            padding: 7px 12px;
            text-transform: uppercase;
        }

        .trend-grid {
            display: grid;
            gap: 16px;
            grid-template-columns: repeat(5, minmax(0, 1fr));
        }

        .trend-item {
            background: var(--paper-white);
            border-left: 4px solid var(--prestige-gold);
            min-height: 100%;
            padding: 20px;
        }

        .trend-item p {
            color: var(--on-surface-variant);
            font-size: 14px;
            line-height: 22px;
            margin: 0;
        }

        .idea-box {
            background: var(--primary-dark);
            color: #ffffff;
            padding: 56px 0;
        }

        .idea-box h2 {
            color: #ffffff;
            font-size: 32px;
            font-weight: 700;
            line-height: 40px;
            margin-bottom: 16px;
        }

        .idea-box .eyebrow {
            color: var(--prestige-gold);
        }

        .idea-layout {
            align-items: center;
            display: grid;
            gap: 32px;
            grid-template-columns: minmax(0, 2fr) minmax(260px, 1fr);
        }

        .idea-box p {
            color: rgba(255, 255, 255, 0.82);
            font-size: 17px;
            line-height: 27px;
            margin: 0;
            max-width: 720px;
        }

        .idea-link {
            align-items: center;
            background: var(--prestige-gold);
            border-radius: 4px;
            color: #211b00;
            display: inline-flex;
            font-family: "Montserrat", Arial, sans-serif;
            font-size: 14px;
            font-weight: 700;
            justify-content: center;
            line-height: 16px;
            min-height: 48px;
            padding: 14px 20px;
            text-align: center;
            text-decoration: none;
            width: 100%;
        }

        .idea-link:hover {
            color: #211b00;
            filter: brightness(0.96);
        }

        .site-footer {
            background: #000000;
            color: rgba(255, 255, 255, 0.72);
            padding: 28px 0;
        }

        .footer-inner {
            align-items: center;
            display: flex;
            gap: 20px;
            justify-content: space-between;
        }

        .footer-inner p {
            font-size: 13px;
            line-height: 20px;
            margin: 0;
        }

        @media (max-width: 1024px) {
            .hero-grid,
            .section-intro,
            .headline-layout {
                grid-template-columns: 1fr;
            }

            .initiative-grid {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }

            .trend-grid {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }

            .tool-panel {
                position: static;
            }

            .story-card {
                grid-template-columns: 180px minmax(0, 1fr);
            }
        }

        @media (max-width: 720px) {
            .container {
                width: min(100% - 32px, var(--max-width));
            }

            .nav {
                align-items: flex-start;
                flex-direction: column;
                gap: 8px;
                padding: 22px 0;
            }

            .nav-links {
                gap: 14px 18px;
                justify-content: flex-start;
            }

            .nav-links a {
                padding: 6px 0;
            }

            .hero {
                min-height: 560px;
                padding: 72px 0 64px;
            }

            h1 {
                font-size: 36px;
                line-height: 44px;
            }

            .hero-copy {
                font-size: 16px;
                line-height: 26px;
            }

            section {
                padding: 56px 0;
            }

            .section-intro h2 {
                font-size: 28px;
                line-height: 36px;
            }

            .initiative-grid,
            .trend-grid {
                grid-template-columns: 1fr;
            }

            .story-card {
                grid-template-columns: 1fr;
            }

            .card-body,
            .story-card,
            .tool-content {
                padding: 22px;
            }

            .idea-layout {
                grid-template-columns: 1fr;
            }

            .footer-inner {
                align-items: flex-start;
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-shell">
            <header class="site-header">
                <div class="container nav" aria-label="Navigatie nieuwsbrief">
                    <a class="brand" href="#top">Innovation Circle</a>
                    <nav class="nav-links" aria-label="Secties">
                        <a class="is-active" href="#initiatives">Initiatieven</a>
                        <a href="#headlines">Nieuws</a>
                        <a href="#trends">Trends</a>
                        <a href="#ideeenbus">Ideeënbus</a>
                    </nav>
                </div>
            </header>

            <main id="top">
                <section class="hero" aria-labelledby="newsletter-title">
                    <div class="container hero-grid">
                        <div>
                            <p class="eyebrow">Maandelijkse nieuwsbrief | april 2026</p>
                            <h1 id="newsletter-title">Innovation Circle &amp; AI- en technologiebrief</h1>
                            <p class="hero-copy">Een compacte update over interne innovaties voor het salesteam en een selectie van de belangrijkste AI- en technologieontwikkelingen van de afgelopen maand.</p>
                        </div>
                        <aside class="issue-panel" aria-label="Overzicht van deze editie">
                            <dl>
                                <div>
                                    <dt>Focus</dt>
                                    <dd>Prospectinformatie, leadinformatie en AI-infrastructuur</dd>
                                </div>
                                <div>
                                    <dt>In deze editie</dt>
                                    <dd>4 interne initiatieven, 5 nieuwsverhalen, 5 markttrends</dd>
                                </div>
                            </dl>
                        </aside>
                    </div>
                </section>

                <section id="initiatives" aria-labelledby="initiatives-title">
                    <div class="container">
                        <div class="section-intro">
                            <div>
                                <p class="eyebrow">Innovation Circle</p>
                                <h2 id="initiatives-title">Slimmer werken met prospect- en leadinformatie</h2>
                            </div>
                            <p>De Innovation Circle onderzoekt prototypes die terugkerend zoekwerk verminderen, actuele commerciële signalen sneller boven water halen en collega&apos;s helpen om beter voorbereid met prospects aan de slag te gaan.</p>
                        </div>

                        <div class="initiative-grid">
                            <article class="initiative-card">
                                <figure class="card-media">
                                    <svg class="visual-svg" viewBox="0 0 640 400" role="img" aria-label="Analyse van zakelijke gegevens op een laptop">
                                        <rect class="visual-bg" width="640" height="400" />
                                        <rect class="visual-panel" x="92" y="76" width="456" height="236" rx="10" />
                                        <rect class="visual-primary" x="126" y="112" width="172" height="20" rx="3" />
                                        <rect class="visual-muted" x="126" y="154" width="388" height="12" rx="2" />
                                        <rect class="visual-muted" x="126" y="184" width="304" height="12" rx="2" />
                                        <rect class="visual-gold" x="126" y="232" width="88" height="46" rx="4" />
                                        <rect class="visual-primary" x="236" y="204" width="88" height="74" rx="4" />
                                        <rect class="visual-primary-dark" x="346" y="172" width="88" height="106" rx="4" />
                                        <rect class="visual-muted" x="160" y="330" width="320" height="14" rx="7" />
                                    </svg>
                                </figure>
                                <div class="card-body">
                                    <span class="card-index">01</span>
                                    <h3>Prospectinformatie sneller verzamelen</h3>
                                    <p>Het salesteam heeft vaak actuele informatie nodig over prospects, zoals activa en andere bedrijfsgegevens. Met dit prototype wordt onderzocht hoe een Python-script automatisch inlogt op Company.info en relevante informatie verzamelt.</p>
                                </div>
                            </article>

                            <article class="initiative-card">
                                <figure class="card-media">
                                    <svg class="visual-svg" viewBox="0 0 640 400" role="img" aria-label="Zakelijke bespreking rond een vergadertafel">
                                        <rect class="visual-bg" width="640" height="400" />
                                        <circle class="visual-primary" cx="190" cy="126" r="42" />
                                        <circle class="visual-primary-dark" cx="450" cy="126" r="42" />
                                        <circle class="visual-gold" cx="320" cy="104" r="34" />
                                        <rect class="visual-panel" x="104" y="202" width="432" height="112" rx="14" />
                                        <rect class="visual-primary" x="150" y="238" width="114" height="14" rx="3" />
                                        <rect class="visual-muted" x="150" y="266" width="160" height="10" rx="2" />
                                        <rect class="visual-primary-dark" x="346" y="238" width="144" height="14" rx="3" />
                                        <rect class="visual-muted" x="346" y="266" width="104" height="10" rx="2" />
                                    </svg>
                                </figure>
                                <div class="card-body">
                                    <span class="card-index">02</span>
                                    <h3>Nieuwe M&amp;A-deals signaleren</h3>
                                    <p>Recente M&amp;A-deals kunnen interessante commerciële kansen opleveren. Dit initiatief verkent hoe een geautomatiseerd script wekelijks relevante websites kan doorzoeken en nieuwe deals kan verzamelen.</p>
                                </div>
                            </article>

                            <article class="initiative-card">
                                <figure class="card-media">
                                    <svg class="visual-svg" viewBox="0 0 640 400" role="img" aria-label="Professioneel netwerk en digitale profielen op een scherm">
                                        <rect class="visual-bg" width="640" height="400" />
                                        <rect class="visual-panel" x="96" y="70" width="448" height="260" rx="10" />
                                        <circle class="visual-primary" cx="222" cy="172" r="46" />
                                        <circle class="visual-gold" cx="418" cy="172" r="46" />
                                        <path d="M268 172h104" stroke="#00666b" stroke-width="8" stroke-linecap="round" />
                                        <rect class="visual-muted" x="166" y="246" width="112" height="12" rx="2" />
                                        <rect class="visual-muted" x="362" y="246" width="112" height="12" rx="2" />
                                        <rect class="visual-primary-dark" x="204" y="272" width="232" height="14" rx="3" />
                                    </svg>
                                </figure>
                                <div class="card-body">
                                    <span class="card-index">03</span>
                                    <h3>LinkedIn-profielen van prospects vinden</h3>
                                    <p>De LinkedIn Finder onderzoekt hoe een AI-agent automatisch passende profielen kan zoeken, zodat collega&apos;s sneller de juiste contactpersonen vinden en meer tijd besteden aan opvolging.</p>
                                </div>
                            </article>

                            <article class="initiative-card">
                                <figure class="card-media">
                                    <svg class="visual-svg" viewBox="0 0 640 400" role="img" aria-label="Dashboard met zakelijke data en grafieken">
                                        <rect class="visual-bg" width="640" height="400" />
                                        <rect class="visual-panel" x="82" y="66" width="476" height="268" rx="10" />
                                        <rect class="visual-primary" x="116" y="104" width="154" height="18" rx="3" />
                                        <rect class="visual-muted" x="116" y="150" width="150" height="76" rx="6" />
                                        <rect class="visual-muted" x="294" y="150" width="228" height="76" rx="6" />
                                        <path d="M130 282l64-44 62 24 76-62 78 34 84-74" fill="none" stroke="#00666b" stroke-width="10" stroke-linecap="round" stroke-linejoin="round" />
                                        <circle class="visual-gold" cx="494" cy="160" r="18" />
                                    </svg>
                                </figure>
                                <div class="card-body">
                                    <span class="card-index">04</span>
                                    <h3>Leads batches slimmer samenstellen</h3>
                                    <p>Met dit initiatief wordt gekeken hoe een Python-script leads kan zoeken op basis van specifieke criteria, bijvoorbeeld per private banker-regio, inclusief activa, leeftijd en contactgegevens.</p>
                                </div>
                            </article>
                        </div>
                    </div>
                </section>

                <section id="headlines" class="callout-band" aria-labelledby="headlines-title">
                    <div class="container">
                        <div class="section-intro">
                            <div>
                                <p class="eyebrow">Belangrijkste nieuws van de afgelopen maand</p>
                                <h2 id="headlines-title">AI- en technologiebrief</h2>
                            </div>
                            <p>De grootste bewegingen zitten deze maand rond AI-investeringen, cloudconcurrentie, modelreleases en de verschuiving van prototypes naar productiegerichte AI-agentprocessen.</p>
                        </div>

                        <div class="headline-layout">
                            <div class="story-list">
                                <article class="story-card">
                                    <figure class="story-media">
                                        <svg class="visual-svg" viewBox="0 0 420 300" role="img" aria-label="Abstracte datacenter- en chipinfrastructuur">
                                            <rect class="visual-bg" width="420" height="300" />
                                            <rect class="visual-panel" x="84" y="48" width="252" height="204" rx="8" />
                                            <rect class="visual-primary" x="118" y="82" width="184" height="26" rx="4" />
                                            <rect class="visual-muted" x="118" y="128" width="184" height="18" rx="3" />
                                            <rect class="visual-muted" x="118" y="164" width="184" height="18" rx="3" />
                                            <rect class="visual-gold" x="118" y="200" width="184" height="18" rx="3" />
                                        </svg>
                                    </figure>
                                    <div>
                                        <span class="story-meta">Resultaten grote techbedrijven</span>
                                        <h3>AI-investeringen worden een strategische machtsfactor</h3>
                                        <p>Alphabet, Meta, Microsoft, Amazon en Apple rapporteerden sterke groei, met bijzonder veel aandacht voor cloudomzet, AI-omzetrunrates en fors hogere investeringsplannen voor rekenkracht en datacenters.</p>
                                        <div class="watch-list">
                                            <p><strong>Let op:</strong> AI-verdienmodellen, datacenterbeperkingen en regulering rond marktmacht.</p>
                                        </div>
                                    </div>
                                </article>

                                <article class="story-card">
                                    <figure class="story-media">
                                        <svg class="visual-svg" viewBox="0 0 420 300" role="img" aria-label="Moderne auto op een weg met digitale mobiliteitsassociatie">
                                            <rect class="visual-bg" width="420" height="300" />
                                            <path class="visual-primary" d="M92 170h236l-28-54H146z" />
                                            <rect class="visual-primary-dark" x="72" y="164" width="276" height="58" rx="18" />
                                            <circle class="visual-gold" cx="132" cy="224" r="24" />
                                            <circle class="visual-gold" cx="288" cy="224" r="24" />
                                            <path d="M126 86h168M160 58h100M184 114h52" stroke="#00666b" stroke-width="8" stroke-linecap="round" />
                                        </svg>
                                    </figure>
                                    <div>
                                        <span class="story-meta">Verspreiding van Gemini</span>
                                        <h3>Google brengt Gemini naar auto&apos;s en verdiept defensierelaties</h3>
                                        <p>Google kondigde Gemini-integratie aan voor voertuigen met ingebouwde Google-services en sloot daarnaast een geclassificeerde AI-deal met het Pentagon.</p>
                                        <div class="watch-list">
                                            <p><strong>Let op:</strong> Reacties van Apple, Amazon, automakers en toezichthouders op militair AI-gebruik.</p>
                                        </div>
                                    </div>
                                </article>

                                <article class="story-card">
                                    <figure class="story-media">
                                        <svg class="visual-svg" viewBox="0 0 420 300" role="img" aria-label="Serverruimte met cloudinfrastructuur">
                                            <rect class="visual-bg" width="420" height="300" />
                                            <rect class="visual-panel" x="70" y="62" width="280" height="176" rx="10" />
                                            <rect class="visual-primary" x="100" y="92" width="220" height="24" rx="4" />
                                            <rect class="visual-muted" x="100" y="134" width="220" height="24" rx="4" />
                                            <rect class="visual-muted" x="100" y="176" width="220" height="24" rx="4" />
                                            <circle class="visual-gold" cx="300" cy="104" r="7" />
                                            <circle class="visual-gold" cx="300" cy="146" r="7" />
                                            <circle class="visual-gold" cx="300" cy="188" r="7" />
                                        </svg>
                                    </figure>
                                    <div>
                                        <span class="story-meta">Cloudstrategie</span>
                                        <h3>OpenAI verschuift naar multi-cloud distributie</h3>
                                        <p>De aangepaste OpenAI-Microsoft samenwerking maakt bredere cloudbeschikbaarheid mogelijk. Amazon kondigde daarop OpenAI-modelbeschikbaarheid op AWS aan, inclusief nieuwe agentdiensten.</p>
                                        <div class="watch-list">
                                            <p><strong>Let op:</strong> Prijs-, prestatie- en leveranciersafhankelijkheid tussen Azure, AWS en Google Cloud.</p>
                                        </div>
                                    </div>
                                </article>

                                <article class="story-card">
                                    <figure class="story-media">
                                        <svg class="visual-svg" viewBox="0 0 420 300" role="img" aria-label="Abstracte visualisatie van neurale netwerken">
                                            <rect class="visual-bg" width="420" height="300" />
                                            <path d="M120 86l92 64-92 64M212 150l88-46M212 150l88 58" fill="none" stroke="#00666b" stroke-width="8" stroke-linecap="round" />
                                            <circle class="visual-primary" cx="120" cy="86" r="24" />
                                            <circle class="visual-gold" cx="120" cy="214" r="24" />
                                            <circle class="visual-primary-dark" cx="212" cy="150" r="28" />
                                            <circle class="visual-primary" cx="300" cy="104" r="24" />
                                            <circle class="visual-gold" cx="300" cy="208" r="24" />
                                        </svg>
                                    </figure>
                                    <div>
                                        <span class="story-meta">Nieuwe modelreleases</span>
                                        <h3>Open en efficiënte modellen blijven terrein winnen</h3>
                                        <p>GLM-5.1, Nemotron 3 Nano, Mistral 3.5 en Qwen 3.5 leggen de nadruk op langetermijnredeneren, multimodaliteit, codeprestaties en efficiënte inferentie.</p>
                                        <div class="watch-list">
                                            <p><strong>Let op:</strong> Onafhankelijke evaluaties in echte AI-agentprocessen en zakelijke adoptie.</p>
                                        </div>
                                    </div>
                                </article>

                                <article class="story-card">
                                    <figure class="story-media">
                                        <svg class="visual-svg" viewBox="0 0 420 300" role="img" aria-label="Close-up van elektronische infrastructuur en chips">
                                            <rect class="visual-bg" width="420" height="300" />
                                            <rect class="visual-primary-dark" x="140" y="70" width="140" height="140" rx="12" />
                                            <rect class="visual-gold" x="174" y="104" width="72" height="72" rx="8" />
                                            <path d="M120 94H82M120 136H82M120 178H82M300 94h38M300 136h38M300 178h38M164 230v34M210 230v34M256 230v34" stroke="#00666b" stroke-width="8" stroke-linecap="round" />
                                        </svg>
                                    </figure>
                                    <div>
                                        <span class="story-meta">Infrastructuur</span>
                                        <h3>AI-infrastructuur richt zich op latentie, geheugen en agentkosten</h3>
                                        <p>Nieuwe tooling rond streaming spraak, KV-aware routing, agent-aware scheduling en efficiënte long-context attention pakt praktische knelpunten aan voor productiegebruik.</p>
                                        <div class="watch-list">
                                            <p><strong>Let op:</strong> Integratie in ontwikkeltools en impact op cloudkosten en gebruikerservaring.</p>
                                        </div>
                                    </div>
                                </article>
                            </div>

                            <aside class="tool-panel" aria-labelledby="tool-title">
                                <figure class="tool-media">
                                    <svg class="visual-svg" viewBox="0 0 640 360" role="img" aria-label="GPU- en serverinfrastructuur voor AI-werklasten">
                                        <rect class="visual-bg" width="640" height="360" />
                                        <rect class="visual-panel" x="92" y="70" width="456" height="220" rx="12" />
                                        <rect class="visual-primary-dark" x="132" y="110" width="160" height="140" rx="10" />
                                        <rect class="visual-primary" x="348" y="110" width="160" height="140" rx="10" />
                                        <rect class="visual-gold" x="176" y="154" width="72" height="52" rx="6" />
                                        <rect class="visual-gold" x="392" y="154" width="72" height="52" rx="6" />
                                        <path d="M292 180h56M212 250v46M428 250v46" stroke="#00666b" stroke-width="10" stroke-linecap="round" />
                                    </svg>
                                </figure>
                                <div class="tool-content">
                                    <span class="tool-badge">Hulpmiddel van de maand</span>
                                    <h3 id="tool-title">NVIDIA Dynamo</h3>
                                    <p>Dynamo is een softwarestack voor AI-agentwerklasten, vooral code-assistenten. De stack gebruikt onder meer KV-bewuste routering, agentbewuste planning, meerlaagse caching en uniforme orkestratie.</p>
                                    <ul>
                                        <li>Relevant voor teams die AI-codeassistenten of AI-agentprocessen bouwen.</li>
                                        <li>Gericht op lagere kosten per token en betere responstijd bij meerstapssessies.</li>
                                        <li>Vraagt compatibele modellen, infrastructuur en volwassen operationele inrichting.</li>
                                    </ul>
                                </div>
                            </aside>
                        </div>
                    </div>
                </section>

                <section id="trends" aria-labelledby="trends-title">
                    <div class="container">
                        <div class="section-intro">
                            <div>
                                <p class="eyebrow">Trends die we zien</p>
                                <h2 id="trends-title">Wat deze maand opvalt</h2>
                            </div>
                            <p>De nieuwsverhalen wijzen op een markt waarin infrastructuur, distributie en betrouwbaarheid de doorslag geven voor zakelijke AI-toepassingen.</p>
                        </div>

                        <div class="trend-grid">
                            <div class="trend-item">
                                <p><strong>AI-investeringen</strong> worden een bepalende concurrentiefactor voor de grootste techbedrijven.</p>
                            </div>
                            <div class="trend-item">
                                <p><strong>Multi-cloud</strong> en open modellen maken toegang flexibeler en verminderen afhankelijkheid van één leverancier.</p>
                            </div>
                            <div class="trend-item">
                                <p><strong>AI-agentprocessen</strong> bewegen van prototype naar productiegerichte implementaties.</p>
                            </div>
                            <div class="trend-item">
                                <p><strong>Multimodaal en spraak</strong> groeien naar gecombineerde invoer voor rijkere interacties.</p>
                            </div>
                            <div class="trend-item">
                                <p><strong>Regulering</strong> en geopolitiek bepalen steeds vaker waar en hoe AI gebouwd wordt.</p>
                            </div>
                        </div>
                    </div>
                </section>

                <section id="ideeenbus" class="idea-box" aria-labelledby="ideeenbus-title">
                    <div class="container idea-layout">
                        <div>
                            <p class="eyebrow">Ideeënbus</p>
                            <h2 id="ideeenbus-title">Heb je een idee voor de Innovation Circle?</h2>
                            <p>Deel je suggestie voor een prototype, procesverbetering of AI-toepassing die collega&apos;s sneller, slimmer of zorgvuldiger kan laten werken. De formulierlink wordt hier later toegevoegd.</p>
                        </div>
                        <a class="idea-link" href="#" aria-label="Placeholder voor de toekomstige link naar het ideeënformulier">Idee insturen</a>
                    </div>
                </section>
            </main>

            <footer class="site-footer">
                <div class="container footer-inner">
                    <p>Innovation Circle Nieuwsbrief | Voor interne briefing</p>
                    <p>Ontwerpsysteem: corporate modernisme voor private banking</p>
                </div>
            </footer>
        </div>
    </form>
</body>
</html>
