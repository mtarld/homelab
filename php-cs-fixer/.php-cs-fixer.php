<?php

return (new PhpCsFixer\Config())
    // @see https://github.com/PHP-CS-Fixer/PHP-CS-Fixer/pull/7777
    ->setParallelConfig(PhpCsFixer\Runner\Parallel\ParallelConfigFactory::detect())
    ->setRules([
        '@Symfony' => true,
        '@Symfony:risky' => true,
        'trailing_comma_in_multiline' => ['elements' => ['arguments', 'arrays', 'match', 'parameters']],
    ])
    ->setRiskyAllowed(true)
;
