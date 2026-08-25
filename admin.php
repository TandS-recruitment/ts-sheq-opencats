<?php
declare(strict_types=1);
if (session_status() !== PHP_SESSION_ACTIVE) session_start();
if (empty($_SESSION['CATS'])) { http_response_code(403); exit('OpenCATS login required.'); }
echo '<h1>T&S SHEQ Recruitment Extension</h1>';
echo '<p>ATS + Client Management extension layer loaded.</p>';
echo '<ul><li>Candidate references</li><li>POPIA consent/disclosure fields</li><li>CV parsing adapter</li><li>CV redaction adapter</li><li>Client/vacancy/placement schema</li></ul>';
