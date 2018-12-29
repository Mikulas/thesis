<?php

namespace App\Controller;

use App\Repository\ArticleRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;


class PostListController extends AbstractController
{

    /**
     * @var ArticleRepository
     */
    private $articles;

    public function __construct(ArticleRepository $articles)
    {
        $this->articles = $articles;
    }


    /**
      * @Route("/")
      */
    public function listPosts()
    {
        $articles = $this->articles->findBy([], ['createdAt' => 'DESC']);

        return $this->render('posts.html.twig', [
            'title' => 'P2: Ukázkový dynamická aplikace',
            'articles' => $articles,
        ]);
    }

}
