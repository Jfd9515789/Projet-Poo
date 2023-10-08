<?php

namespace App\Controller;

use App\Entity\Comments;
use App\Entity\Painting;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class PaintController extends AbstractController
{
    /**
     * @return Response
     */
    #[Route('/paint', name: 'paint')]
    public function index(): Response
    {
        $paints = $this->getDoctrine()
            ->getRepository(Painting::class)
            ->findAll();
        dump($paints);
        return $this->render('paint/index.html.twig', ['paints' => $paints]);
    }

    /**
     * @return Response
     */
    #[Route('/gallery', name: 'gallery')]
    public function gallery(): Response
    {
        $paints = $this->getDoctrine()
            ->getRepository(Painting::class)
            ->findAll();
        dump($paints);
        return $this->render('paint/gallery.html.twig', ['paints' => $paints]);
    }

    /**
     * @return Response
     */
    #[Route('/about', name: 'about')]
    public function about(): Response
    {
        return $this->render('paint/about.html.twig');
    }

    /**
     * @return Response
     */
    #[Route('/team', name: 'team')]
    public function team(): Response
    {
        return $this->render('paint/team.html.twig');
    }

    /**
     * @param Painting $paint
     * @return Response
     */
    #[Route('/detail/{id}', name: 'detail')]
    // PARAMCONVERTER
    public function detail(Painting $paint, Comments $comments): Response
    {
        return $this->render('paint/detail.html.twig', [
            'paint' => $paint,
            'comment' => $comments
        ]);
    }

}
