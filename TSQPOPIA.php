<?php
declare(strict_types=1);
final class TSQPOPIA {
    public static function canDisclose(bool $consent, bool $disclosureAllowed): bool { return $consent && $disclosureAllowed; }
}
