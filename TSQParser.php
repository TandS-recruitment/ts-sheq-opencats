<?php
declare(strict_types=1);
final class TSQParser {
    public static function parsePlainText(string $text): array {
        $email = null; $phone = null;
        if (preg_match('/[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}/i', $text, $m)) $email = $m[0];
        if (preg_match('/(?<!\d)(?:\+?27\s?|0)(?:\d[\s.-]?){8,10}(?!\d)/', $text, $m)) $phone = trim($m[0]);
        return ['email'=>$email,'phone'=>$phone,'raw_text'=>$text];
    }
}
