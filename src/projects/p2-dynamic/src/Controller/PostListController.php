<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;


class PostListController extends AbstractController
{
    /**
      * @Route("/")
      */
    public function listPosts()
    {
        return $this->render('posts.html.twig', [
            'number' => mt_rand(1, 100),
        ]);
    }

}
