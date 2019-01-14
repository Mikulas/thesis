<?php

namespace App\Controller;

use App\Repository\ArticleRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Session\Session;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Annotation\Route;


class PostListController extends AbstractController
{

    /**
     * @var ArticleRepository
     */
    private $articles;
    /**
     * @var Session
     */
    private $session;

    public function __construct(ArticleRepository $articles, SessionInterface $session)
    {
        $this->articles = $articles;
        $this->session = $session;
    }


    /**
      * @Route("/")
      */
    public function listPosts()
    {
        $this->session->start();
        $views = $this->session->get('views') ?? 0 + 1;
        $this->session->set('views', $views);

        $articles = $this->articles->findBy([], ['createdAt' => 'DESC']);

        return $this->render('posts.html.twig', [
            'title' => 'P2: Ukázková dynamická aplikace',
            'views' => $views,
            'articles' => $articles,
        ]);
    }

}
