<?php

use Doctrine\DBAL\Connection;

/** @var $sql Nextras\Migrations\Entities\File */
/** @var $dbal Connection */

$faker = Faker\Factory::create('cs_CZ');

define('DATE_FMT', 'Y-m-d H:i:s');

$dbal->transactional(function (Connection $dbal) use ($faker) {
    for ($i = 0; $i < 20; $i++) {
        $dbal->insert('article', [
            'title' => $faker->sentence(),
            'body' => implode("\n\n", $faker->paragraphs()),
            'created_at' => $created = $faker->dateTimeThisYear()->format(DATE_FMT),
            'updated_at' => $faker->dateTimeBetween($created, 'now')->format(DATE_FMT),
        ]);
    }
});
