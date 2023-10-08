<?php

namespace App\Form;

use App\Entity\Painting;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class PaintingType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('title', TextType::class, [
                'label' => 'Titre de la peinture'
            ])
            ->add('description', TextareaType::class, [
                'label' => 'Contenu de la peinture'
            ])
            ->add('height')
            ->add('width')
            ->add('category', EntityType::class, [
                'label' => 'Enregistrer la peinture',
                'placeholder' => 'Sélectionnez une categorie',
                'class' => 'App:Category',
                'choice_label' => 'name'
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Painting::class,
        ]);
    }
}
