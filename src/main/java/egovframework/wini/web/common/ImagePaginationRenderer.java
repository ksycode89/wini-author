package egovframework.wini.web.common;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

public class ImagePaginationRenderer extends AbstractPaginationRenderer
        implements ServletContextAware {

    private ServletContext servletContext;

    public ImagePaginationRenderer() {

    }

    public void initVariables() {
        
        firstPageLabel = "<a class=\"first\" href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \">처음페이지</a>&#160;";
        previousPageLabel = "<a class=\"prev\" href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \">이전페이지</a>&#160;";
        currentPageLabel = "<a class=\"active\" href=\"#\"><strong>{0}</strong></a>&#160;";
        otherPageLabel = "<a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \">{2}</a>&#160;";
        nextPageLabel = "<a class=\"next\" href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \">다음페이지</a>&#160;";
        lastPageLabel = "<a class=\"last\" href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \">마지막페이지</a>&#160;";
    }

    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
        initVariables();
    }

}
