# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A gem to generate an EPUB e-book from Jekyll posts and pages"
HOMEPAGE="https://github.com/lmullen/jekyll-ebook"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/pandoc-ruby-0.6.0"

