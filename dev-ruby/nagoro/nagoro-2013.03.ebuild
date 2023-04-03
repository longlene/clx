# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.markdown"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="An extendible and fast templating engine in pure ruby"
HOMEPAGE="http://github.com/manveru/nagoro"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""


