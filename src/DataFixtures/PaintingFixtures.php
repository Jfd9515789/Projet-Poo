<?php

namespace App\DataFixtures;

use App\Entity\Category;
use App\Entity\Painting;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Doctrine\Persistence\ObjectManager;
use Faker;

class PaintingFixtures extends Fixture implements DependentFixtureInterface
{
    public function load(ObjectManager $manager): void
    {
        $faker = Faker\Factory::create();
        $categories = $manager->getRepository(Category::class)->findAll();
        for ($i = 1; $i <= 10; $i++) {
            $paint = new Painting();
            $paint->setTitle($faker->words($faker->numberBetween(3, 5), true))
                ->setDescription($faker->paragraphs(3, true))
                ->setCreated(new \DateTimeImmutable())
                ->setHeight($faker->numberBetween(13, 29))
                ->setWidth($faker->numberBetween(13, 29))
                ->setImage($i . '.png')
                ->setCategory(($categories[$faker->numberBetween(0, count($categories) - 1)]));
            $manager->persist($paint);
        }
        $manager->flush();
    }

    public function getDependencies()
    {
        return [
            CategoryFixtures::class
        ];
    }
}
