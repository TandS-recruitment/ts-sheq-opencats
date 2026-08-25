<?php
declare(strict_types=1);
require_once __DIR__ . '/../../lib/TSQParser.php';
header('Content-Type: application/json');
if ($_SERVER['REQUEST_METHOD'] !== 'POST') { http_response_code(405); echo json_encode(['error'=>'POST required']); exit; }
$data = json_decode(file_get_contents('php://input') ?: '{}', true);
echo json_encode(['ok'=>true,'candidate'=>TSQParser::parsePlainText((string)($data['text'] ?? ''))]);
