<?php

namespace App\Controller;

use App\Entity\Painting;
use App\Form\PaintingType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AdminController extends AbstractController
{
    #[Route('/admin', name: 'admin')]
    public function admin(): Response
    {
        $paints = $this->getDoctrine()
            ->getRepository(Painting::class)
            ->findAll();
        return $this->render('admin/admin.html.twig', ['paints' => $paints]);
    }

    /**
     * @param Request $request
     * @param EntityManagerInterface $manager
     * @return Response
     */
    #[Route('newpaints', name: 'newpaints')]
    public function newPaint(Request $request, EntityManagerInterface $manager): Response
    {
        $paint = new Painting;
        $form = $this->createForm(PaintingType::class, $paint);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $paint->setImage('default.png');
            $paint->setCreated(new \DateTimeImmutable());
            $manager->persist($paint);
            $manager->flush();
            return $this->redirectToRoute('admin');
        }

        return $this->renderForm('admin/newpaint.html.twig', ['form' => $form]);
    }

    #[Route('editpaints/{id}', name: 'editpaints')]
    public function editPost(Painting $paint, EntityManagerInterface $manager, Request $request)
    {
        $form = $this->createForm(PaintingType::class, $paint);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $paint->setImage('default.png');
            $paint->setCreated(new \DateTimeImmutable());
            $manager->persist($paint);
            $manager->flush();
            return $this->redirectToRoute('admin');
        }
        return $this->renderForm('admin/editpaint.html.twig', [
            'form' => $form
        ]);
    }

    /**
     * @param Painting $paint
     * @param EntityManagerInterface $manager
     * @return Response
     */
    #[Route('delpaint/{id}', name: 'delpaint')]
    public function delPaint(Painting $paint, EntityManagerInterface $manager): Response
    {
        $manager->remove($paint);
        $manager->flush();
        return $this->redirectToRoute('admin');
    }
}
