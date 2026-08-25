<?php
declare(strict_types=1);
final class TSQRedactor {
    public static function redactText(string $text, string $candidateRef): string {
        $text = preg_replace('/[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}/i', '[EMAIL REDACTED]', $text);
        $text = preg_replace('/(?<!\d)(?:\+?27\s?|0)(?:\d[\s.-]?){8,10}(?!\d)/', '[PHONE REDACTED]', $text);
        $text = preg_replace('/\b\d{13}\b/', '[ID NUMBER REDACTED]', $text);
        $text = preg_replace('/\b(?:passport|pass\.?port)\s*(?:no|number)?\s*[:#-]?\s*[A-Z0-9]{6,12}\b/i', '[PASSPORT REDACTED]', $text);
        return "Candidate Reference: {$candidateRef}\n\n" . trim($text);
    }
    public static function safeFilename(string $candidateRef): string { return preg_replace('/[^A-Za-z0-9_-]/', '_', $candidateRef) . '-Redacted-CV.txt'; }
}
