<?php
declare(strict_types=1);
require_once __DIR__ . '/../../lib/TSQRedactor.php';
header('Content-Type: application/json');
if ($_SERVER['REQUEST_METHOD'] !== 'POST') { http_response_code(405); echo json_encode(['error'=>'POST required']); exit; }
$data = json_decode(file_get_contents('php://input') ?: '{}', true);
$ref = (string)($data['candidate_ref'] ?? 'TS-2026-0001');
$text = (string)($data['text'] ?? '');
echo json_encode(['ok'=>true,'candidate_ref'=>$ref,'filename'=>TSQRedactor::safeFilename($ref),'redacted_text'=>TSQRedactor::redactText($text,$ref)]);
