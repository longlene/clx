# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="jekyll-category-aware-prev-next adds category aware cat_next and cat_previous to posts since jekyll's next and prev do not take the category into account"
HOMEPAGE="http://github.com/benib/jekyll-category-aware-prev-next"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""


