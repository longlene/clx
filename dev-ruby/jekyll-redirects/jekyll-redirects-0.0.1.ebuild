# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Jekyll extension that makes redirecting within your site a breeze!"
HOMEPAGE="http://rubygems.org/gems/jekyll-redirects"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""


