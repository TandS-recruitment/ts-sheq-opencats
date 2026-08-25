# Installation

1. Back up your OpenCATS files/database (you said you will do this yourself).
2. Import `database/migration.sql` into the OpenCATS MariaDB database.
3. Copy the `config`, `lib`, `ts_sheq`, `storage`, and `docs` directories into the OpenCATS application root, preserving paths.
4. Copy `config/ts-sheq.example.php` to `config/ts-sheq.php` and review settings.
5. Make sure uploaded CVs are not executable as PHP. Keep generated redacted files in a non-executable directory.
6. Visit `/ts_sheq/admin.php` while logged into OpenCATS to verify the extension layer.
7. Test parsing and redaction with a dummy CV before using real candidate data.

IMPORTANT: OpenCATS builds can have different internal database APIs. The integration adapter deliberately does not overwrite OpenCATS core tables. Map the extension's `opencats_*_id` fields to your installed schema after confirming your exact build.
