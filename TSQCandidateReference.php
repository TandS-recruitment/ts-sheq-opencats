<?php
declare(strict_types=1);
final class TSQCandidateReference {
    public static function generate(string $prefix = 'TS', int $year = 0, int $sequence = 1): string {
        $year = $year ?: (int)date('Y');
        return sprintf('%s-%d-%04d', strtoupper($prefix), $year, max(1, $sequence));
    }
}
